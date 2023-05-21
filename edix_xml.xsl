<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <ite>
            <nombre>
                <xsl:value-of select="ite/@nombre" />
            </nombre>
            <contacto>
                <web>
                    <xsl:value-of select="ite/@web" />
                </web>
                <telefono>
                    <xsl:value-of select="ite/telefono" />
                </telefono>
            </contacto>

            <profesores>
                <xsl:for-each select="/ite/profesores/profesor">
                    <!-- Declaramos variables para poder luego insertarlas como atributos sin tener
                    problemas de sintaxis ocasionado por xml -->
                    <xsl:variable name="nombre_profe"
                        select="nombre" />
                    <xsl:variable
                        name="id_profe" select="id" />

                    <!-- referenciamos las variables previamente declaradas -->
                    <profesor id="{$id_profe}"
                        nombre="{$nombre_profe}" />
                </xsl:for-each>
            </profesores>

            <xsl:variable name="nombre_dir" select="ite/director/nombre" />
            <xsl:variable name="despacho_dir" select="ite/director/despacho" />
            <director nombre="{$nombre_dir}" despacho="{$despacho_dir}" />

            <xsl:variable name="nombre_jefe" select="ite/jefe_estudios/nombre" />
            <xsl:variable name="despacho_jefe" select="ite/jefe_estudios/despacho" />
            <jefe_estudios nombre="{$nombre_jefe}" despacho="{$despacho_jefe}" />

            <ciclos>
                <xsl:for-each select="/ite/ciclos/ciclo">
                    <xsl:variable name="nombre_grado" select="nombre" />
                <ciclo
                        nombre="{$nombre_grado}">
                        <id>
                            <xsl:value-of select="@id" />
                        </id>
                        <grado_decreto>Grado: <xsl:value-of select="grado" /> - Decreto: <xsl:value-of
                                select="decretoTitulo/@año" /></grado_decreto>
                    </ciclo>
                </xsl:for-each>
            </ciclos>
        </ite>
    </xsl:template>
</xsl:stylesheet>