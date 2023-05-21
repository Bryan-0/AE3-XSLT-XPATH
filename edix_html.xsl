<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <!-- Declaramos una variable para poder utilizarla luego dentro de atributos de tags html -->
        <xsl:variable name="edix-web" select="ite/@web" />

        <html lang="en">
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>
                    <xsl:value-of select="ite/@nombre" />
                </title>
                <link rel="stylesheet" href="./css/styles.css" />
            </head>
            <body>
                <header class="flex justify-between align-center p-1 border-b-black">
                    <div class="flex justify-center align-center gap-1">
                        <img
                            src="https://ametic.es/sites/default/files//edix-formacion.png"
                            width="100"
                        />
                        <h2>
                            <xsl:value-of select="ite/@nombre" />
                        </h2>
                    </div>
                    <div class="flex flex-direction-column font-size-20 gap-1">
                        <div>Tel. <xsl:value-of select="ite/telefono" /></div>
                        <div class="flex gap-1">
                            <div>
                                <a href="{$edix-web}">Página Web</a>
                            </div>
                            <div>
                                <a href="{$edix-web}/ubicacion">Ubicación</a>
                            </div>
                            <div>
                                <a href="#contacto">Contacto</a>
                            </div>
                        </div>
                    </div>
                </header>
                <main class="p-1">

                    <section id="empresa">
                        <h2>Empresa - <xsl:value-of select="ite/empresa" /></h2>
                        <br />
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat
                            libero laborum vero perferendis dolores. Eum maiores adipisci
                            deleniti error. Praesentium officia quibusdam magni expedita
                            sint voluptatibus fugiat maiores ullam commodi. Lorem ipsum
                            dolor sit amet consectetur adipisicing elit. Fugiat libero
                            laborum vero perferendis dolores. Eum maiores adipisci deleniti
                            error. Praesentium officia quibusdam magni expedita sint
                            voluptatibus fugiat maiores ullam commodi. Lorem ipsum dolor sit
                            amet consectetur adipisicing elit. Fugiat libero laborum vero
                            perferendis dolores. Eum maiores adipisci deleniti error.
                            Praesentium officia quibusdam magni expedita sint voluptatibus
                            fugiat maiores ullam commodi.
                        </p>
                    </section>

                    <br />

                    <section id="profesores">
                        <h2>Profesores</h2>
                        <ul>
                            <xsl:for-each select="/ite/profesores/profesor">
                                <li>
                                    <xsl:value-of select="nombre" />
                                </li>
                            </xsl:for-each>
                        </ul>
                    </section>

                    <br />

                    <section id="ciclos">
                        <h2>Ciclos</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Grado</th>
                                    <th>Decreto Titulo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="/ite/ciclos/ciclo">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="@id" />
                                        </td>
                                        <td>
                                            <xsl:value-of select="nombre" />
                                        </td>
                                        <td>
                                            <xsl:value-of select="grado" />
                                        </td>
                                        <td>
                                            <xsl:value-of select="decretoTitulo/@año" />
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </section>

                    <br />

                    <section id="administrativa">
                        <div class="flex gap-2 justify-center">
                            <div>
                                <h3>Director</h3>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Despacho</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:for-each select="/ite/director">
                                            <tr>
                                                <td>
                                                    <xsl:value-of select="nombre" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="despacho" />
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </div>
                            <div>
                                <h3>Jefe de Estudio</h3>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Despacho</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:for-each select="/ite/jefe_estudios">
                                            <tr>
                                                <td>
                                                    <xsl:value-of select="nombre" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="despacho" />
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <br />

                    <section id="contacto">
                        <h2>Contacto</h2>
                        <br />
                        <form>
                            <fieldset class="p-1 flex align-center flex-wrap gap-2">
                                <legend>Datos</legend>
                                <div class="flex flex-direction-column align-center gap-1-2">
                                    <label for="nombre" class="align-left">Nombre</label>
                                    <input id="nombre" name="nombre" type="text"></input>
                                </div>
                                <div class="flex flex-direction-column align-center gap-1-2">
                                    <label for="apellidos" class="align-left">Apellidos</label>
                                    <input id="apellidos" name="apellidos" type="text"></input>
                                </div>
                                <div class="flex flex-direction-column align-center gap-1-2">
                                    <label for="tel" class="align-left">Número Télefono</label>
                                    <input id="tel" name="tel" type="number"></input>
                                </div>
                                <div class="flex flex-direction-column align-center gap-1-2">
                                    <label for="email" class="align-left">Email</label>
                                    <input id="email" name="email" type="email"></input>
                                </div>
                                <div class="flex flex-direction-column align-center gap-1-2">
                                    <label class="align-left">Ciclo Formativo</label>
                                    <select class="font-size-16">
                                        <xsl:for-each select="/ite/ciclos/ciclo">
                                            <option>
                                                <xsl:value-of select="nombre" />
                                            </option>
                                        </xsl:for-each>
                                    </select>
                                </div>
                                <div class="flex flex-direction-column align-center gap-1-2">
                                    <label for="mas" class="align-left">Cuéntanos más</label>
                                    <textarea id="mas" name="mas"></textarea>
                                </div>
                            </fieldset>
                            <br />
                            <div class="text-center">
                                <button>Enviar</button>
                            </div>
                        </form>
                    </section>

                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>