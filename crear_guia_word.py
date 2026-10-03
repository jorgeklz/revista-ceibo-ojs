#!/usr/bin/env python3
import os
import zipfile

def create_docx(filename):
    content_types = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
  <Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/>
</Types>"""

    rels = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>"""

    doc_rels = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
</Relationships>"""

    styles_xml = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:docDefaults>
    <w:rPrDefault>
      <w:rPr>
        <w:rFonts w:ascii="Calibri" w:hAnsi="Calibri" w:cs="Calibri"/>
        <w:sz w:val="22"/>
        <w:color w:val="2D3748"/>
      </w:rPr>
    </w:rPrDefault>
    <w:pPrDefault>
      <w:pPr>
        <w:spacing w:line="276" w:lineRule="auto" w:after="160"/>
      </w:pPr>
    </w:pPrDefault>
  </w:docDefaults>
</w:styles>"""

    # Helper functions for building WordprocessingML
    def esc(text):
        return (str(text).replace("&", "&amp;")
                         .replace("<", "&lt;")
                         .replace(">", "&gt;")
                         .replace('"', "&quot;")
                         .replace("'", "&apos;"))

    def p(text, size=22, bold=False, color="2D3748", space_before=0, space_after=140, align="left", italic=False):
        b_tag = "<w:b/>" if bold else ""
        i_tag = "<w:i/>" if italic else ""
        jc_tag = f'<w:jc w:val="{align}"/>' if align != "left" else ""
        return f"""<w:p>
          <w:pPr>
            {jc_tag}
            <w:spacing w:before="{space_before}" w:after="{space_after}"/>
          </w:pPr>
          <w:r>
            <w:rPr>
              {b_tag}
              {i_tag}
              <w:color w:val="{color}"/>
              <w:sz w:val="{size}"/>
            </w:rPr>
            <w:t xml:space="preserve">{esc(text)}</w:t>
          </w:r>
        </w:p>"""

    def code_box(code_text):
        return f"""<w:p>
          <w:pPr>
            <w:pBdr>
              <w:top w:val="single" w:sz="4" w:space="4" w:color="CBD5E0"/>
              <w:left w:val="single" w:sz="18" w:space="8" w:color="3182CE"/>
              <w:bottom w:val="single" w:sz="4" w:space="4" w:color="CBD5E0"/>
              <w:right w:val="single" w:sz="4" w:space="4" w:color="CBD5E0"/>
            </w:pBdr>
            <w:shd w:val="clear" w:color="auto" w:fill="F7FAFC"/>
            <w:spacing w:before="120" w:after="160"/>
            <w:ind w:left="240" w:right="240"/>
          </w:pPr>
          <w:r>
            <w:rPr>
              <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas"/>
              <w:color w:val="2C5282"/>
              <w:sz w:val="19"/>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">{esc(code_text)}</w:t>
          </w:r>
        </w:p>"""

    def callout_box(title, text):
        return f"""<w:p>
          <w:pPr>
            <w:pBdr>
              <w:top w:val="single" w:sz="4" w:space="4" w:color="BEE3F8"/>
              <w:left w:val="single" w:sz="24" w:space="8" w:color="2B6CB0"/>
              <w:bottom w:val="single" w:sz="4" w:space="4" w:color="BEE3F8"/>
              <w:right w:val="single" w:sz="4" w:space="4" w:color="BEE3F8"/>
            </w:pBdr>
            <w:shd w:val="clear" w:color="auto" w:fill="EBF8FF"/>
            <w:spacing w:before="140" w:after="180"/>
            <w:ind w:left="240" w:right="240"/>
          </w:pPr>
          <w:r>
            <w:rPr>
              <w:b/>
              <w:color w:val="2B6CB0"/>
              <w:sz w:val="20"/>
            </w:rPr>
            <w:t xml:space="preserve">{esc(title)}: </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:color w:val="2D3748"/>
              <w:sz w:val="20"/>
            </w:rPr>
            <w:t xml:space="preserve">{esc(text)}</w:t>
          </w:r>
        </w:p>"""

    def table(headers, rows, col_widths):
        tbl_xml = ['<w:tbl>',
                   '<w:tblPr>',
                   '<w:tblW w:w="9360" w:type="dxa"/>',
                   '<w:tblBorders>',
                   '<w:top w:val="single" w:sz="4" w:space="0" w:color="CBD5E0"/>',
                   '<w:bottom w:val="single" w:sz="8" w:space="0" w:color="2B6CB0"/>',
                   '<w:insideH w:val="single" w:sz="4" w:space="0" w:color="E2E8F0"/>',
                   '<w:insideV w:val="none"/>',
                   '</w:tblBorders>',
                   '</w:tblPr>']

        # Header row
        tbl_xml.append('<w:tr>')
        tbl_xml.append('<w:trPr><w:tblHeader/></w:trPr>')
        for idx, h in enumerate(headers):
            w = col_widths[idx]
            tbl_xml.append(f"""<w:tc>
              <w:tcPr>
                <w:tcW w:w="{w}" w:type="dxa"/>
                <w:shd w:val="clear" w:color="auto" w:fill="2B6CB0"/>
                <w:tcMar>
                  <w:top w:w="120" w:type="dxa"/>
                  <w:left w:w="160" w:type="dxa"/>
                  <w:bottom w:w="120" w:type="dxa"/>
                  <w:right w:w="160" w:type="dxa"/>
                </w:tcMar>
              </w:tcPr>
              <w:p>
                <w:pPr><w:spacing w:before="0" w:after="0"/></w:pPr>
                <w:r>
                  <w:rPr><w:b/><w:color w:val="FFFFFF"/><w:sz w:val="20"/></w:rPr>
                  <w:t>{esc(h)}</w:t>
                </w:r>
              </w:p>
            </w:tc>""")
        tbl_xml.append('</w:tr>')

        # Body rows
        for r_idx, row in enumerate(rows):
            fill = "F7FAFC" if (r_idx % 2 == 1) else "FFFFFF"
            tbl_xml.append('<w:tr>')
            for idx, cell in enumerate(row):
                w = col_widths[idx]
                is_bold = (idx == 0)
                b_tag = "<w:b/>" if is_bold else ""
                tbl_xml.append(f"""<w:tc>
                  <w:tcPr>
                    <w:tcW w:w="{w}" w:type="dxa"/>
                    <w:shd w:val="clear" w:color="auto" w:fill="{fill}"/>
                    <w:tcMar>
                      <w:top w:w="100" w:type="dxa"/>
                      <w:left w:w="160" w:type="dxa"/>
                      <w:bottom w:w="100" w:type="dxa"/>
                      <w:right w:w="160" w:type="dxa"/>
                    </w:tcMar>
                  </w:tcPr>
                  <w:p>
                    <w:pPr><w:spacing w:before="0" w:after="0"/></w:pPr>
                    <w:r>
                      <w:rPr>{b_tag}<w:color w:val="2D3748"/><w:sz w:val="19"/></w:rPr>
                      <w:t>{esc(cell)}</w:t>
                    </w:r>
                  </w:p>
                </w:tc>""")
            tbl_xml.append('</w:tr>')

        tbl_xml.append('</w:tbl>')
        return "".join(tbl_xml)

    # Document body assembly
    body_parts = []

    # Title & Header
    body_parts.append(p("UNIVERSIDAD TÉCNICA DE MANABÍ", size=24, bold=True, color="2B6CB0", space_before=100, space_after=60, align="center"))
    body_parts.append(p("Posgrado en Aplicaciones Informáticas para la Gestión Editorial", size=20, italic=True, color="4A5568", space_before=0, space_after=140, align="center"))
    body_parts.append(p("Guía de Despliegue en Docker y Credenciales de Acceso", size=32, bold=True, color="1A365D", space_before=60, space_after=100, align="center"))
    body_parts.append(p("Plataforma OJS 3.3 | Revista Ceibo", size=22, bold=True, color="3182CE", space_before=0, space_after=240, align="center"))

    # Section 1: Credenciales
    body_parts.append(p("1. Usuarios Disponibles y Credenciales de Acceso", size=26, bold=True, color="1A365D", space_before=200, space_after=120))
    body_parts.append(callout_box("Contraseña Única General", "Todas las cuentas de usuario comparten la misma contraseña predeterminada: Ceibo2026*"))

    body_parts.append(p("A continuación se detallan las cuentas organizadas por rol editorial:", size=21, color="4A5568", space_before=40, space_after=140))

    headers = ["Usuario", "Nombre Completo", "Rol Principal en OJS", "Correo Institucional"]
    widths = [1800, 2600, 2760, 2200]
    users_data = [
        ["jperez", "Dr. Juan Pérez", "Director / Editor en Jefe y Gestor", "jperez@utm.edu.ec"],
        ["admin", "Administrador OJS", "Administrador del Sitio / Gestor", "jorge.parraga@utm.edu.ec"],
        ["smendoza", "Dra. Sofía Mendoza", "Gestora de la revista", "smendoza@utm.edu.ec"],
        ["emorales", "MSc. Elena Morales", "Editora de Sección (Ciencias Agrarias)", "emorales@utm.edu.ec"],
        ["ralarcon", "Dr. Roberto Alarcón", "Editor de Sección (Educación y TIC)", "ralarcon@utm.edu.ec"],
        ["mgomez", "Dr. Manuel Gómez", "Revisor/a por pares (U. Salamanca)", "mgomez@usal.es"],
        ["lrestrepo", "Dra. Laura Restrepo", "Revisora por pares (U. Nacional Col.)", "lrestrepo@unal.edu.co"],
        ["revisor_ceibo", "Dr. Fernando Castro", "Revisor/a por pares (U. Buenos Aires)", "revisor.ceibo@utm.edu.ec"],
        ["revisor2_ceibo", "Dra. Beatriz Silva", "Revisora por pares (U. São Paulo)", "revisor2.ceibo@utm.edu.ec"],
        ["jbarreiro", "Ing. Juan Barreiro", "Autor/a de correspondencia", "jbarreiro@gmail.com"],
        ["autor_ceibo", "Ing. María Gómez", "Autor/a postulante", "autor.ceibo@utm.edu.ec"],
        ["lector_ceibo", "Lector Ceibo", "Lector/a suscrito", "lector.ceibo@utm.edu.ec"]
    ]
    body_parts.append(table(headers, users_data, widths))
    body_parts.append(p("", space_after=180))

    # Section 2: Despliegue en GitHub Codespaces
    body_parts.append(p("2. Despliegue en la Nube con GitHub Codespaces (Recomendado)", size=26, bold=True, color="1A365D", space_before=240, space_after=120))
    body_parts.append(p("Esta es la opción más sencilla y recomendada para estudiantes y docentes, ya que no requiere instalar Docker ni configurar nada en la computadora personal. Todo se ejecuta en los servidores de GitHub y se accede a través del navegador web.", size=21, space_before=40, space_after=140))
    body_parts.append(callout_box("Beneficio Principal", "Permite que los estudiantes ingresen con cualquier rol editorial (autor, revisor, editor), realicen envíos de artículos y publiquen números completos desde cualquier dispositivo, incluso desde computadoras institucionales o portátiles con recursos limitados."))

    body_parts.append(p("Paso 1: Abrir el Repositorio en GitHub", size=22, bold=True, color="2B6CB0", space_before=140, space_after=60))
    body_parts.append(p("1. Inicie sesión en su cuenta personal de GitHub (https://github.com).", size=21, space_after=40))
    body_parts.append(p("2. Ingrese al enlace del repositorio de la revista proporcionado por el docente.", size=21, space_after=120))

    body_parts.append(p("Paso 2: Crear el Entorno Codespace", size=22, bold=True, color="2B6CB0", space_before=140, space_after=60))
    body_parts.append(p("1. En la parte superior derecha del repositorio, haga clic en el botón verde llamado Code.", size=21, space_after=40))
    body_parts.append(p("2. Seleccione la pestaña Codespaces en el menú desplegable.", size=21, space_after=40))
    body_parts.append(p("3. Haga clic en el botón Create codespace on main.", size=21, space_after=120))

    body_parts.append(p("Paso 3: Esperar la Inicialización Automática", size=22, bold=True, color="2B6CB0", space_before=140, space_after=60))
    body_parts.append(p("GitHub creará una máquina virtual con Linux, descargará las imágenes de OJS y MariaDB, e iniciará la revista de manera 100% automática. Este proceso toma entre 1 y 2 minutos la primera vez.", size=21, space_after=120))

    body_parts.append(p("Paso 4: Abrir la Revista en el Navegador", size=22, bold=True, color="2B6CB0", space_before=140, space_after=60))
    body_parts.append(p("1. Al completarse el inicio, aparecerá una notificación emergente en la esquina inferior derecha con el botón Open in Browser (Abrir en el navegador).", size=21, space_after=40))
    body_parts.append(p("2. Al hacer clic, se abrirá una nueva pestaña con la Revista Ceibo en su dirección web segura de GitHub (por ejemplo: https://nombre-codespace-8080.app.github.dev).", size=21, space_after=40))
    body_parts.append(p("3. Si la ventana emergente no aparece, haga clic en la pestaña Ports en la barra inferior, busque el puerto 8080 y haga clic en el icono del globo terráqueo.", size=21, space_after=140))

    # Section 3: Guía de despliegue local
    body_parts.append(p("3. Ejecución Local con Docker Desktop en otra Computadora", size=26, bold=True, color="1A365D", space_before=240, space_after=120))
    body_parts.append(p("Si prefiere trabajar sin conexión a internet o de manera local, este entorno es compatible con cualquier sistema operativo: macOS (Apple Silicon M1/M2/M3/M4 o Intel), Linux (Ubuntu, Debian, Fedora) y Windows 10/11 con Docker Desktop.", size=21, space_before=40, space_after=140))

    # Paso 1
    body_parts.append(p("Paso 1: Instalación de Prerrequisitos", size=22, bold=True, color="2B6CB0", space_before=160, space_after=60))
    body_parts.append(p("1. Descargue e instale Docker Desktop desde el sitio oficial de Docker (https://www.docker.com/products/docker-desktop).", size=21, space_after=40))
    body_parts.append(p("2. Inicie Docker Desktop y verifique que el servicio se encuentre activo (Engine running con ícono verde).", size=21, space_after=140))

    # Paso 2
    body_parts.append(p("Paso 2: Copiar la Carpeta del Proyecto", size=22, bold=True, color="2B6CB0", space_before=160, space_after=60))
    body_parts.append(p("Copie la carpeta completa plataforma_ojs a la nueva computadora. La carpeta debe contener los siguientes archivos indispensables:", size=21, space_after=80))
    body_parts.append(p("• docker-compose.yml: Orquestación de contenedores MariaDB y OJS con puertos y volúmenes.", size=20, space_after=30))
    body_parts.append(p("• config.inc.php: Archivo de configuración oficial de OJS con base_url y conexión a base de datos.", size=20, space_after=30))
    body_parts.append(p("• init.sql: Respaldo completo de la base de datos con números, artículos, usuarios y revisiones.", size=20, space_after=30))
    body_parts.append(p("• archivos_galeradas/: Carpeta con los archivos PDF reales de todos los artículos publicados.", size=20, space_after=30))
    body_parts.append(p("• custom_patches/: Parches del formateador de citas bibliográficas CSL adaptados a Alpine Linux.", size=20, space_after=30))
    body_parts.append(p("• custom_locale/: Archivos de traducción al español corregidos.", size=20, space_after=140))

    # Paso 3
    body_parts.append(p("Paso 3: Iniciar los Contenedores", size=22, bold=True, color="2B6CB0", space_before=160, space_after=60))
    body_parts.append(p("1. Abra una ventana de terminal (Terminal en macOS/Linux o PowerShell en Windows).", size=21, space_after=40))
    body_parts.append(p("2. Navegue hasta el directorio donde copió el proyecto:", size=21, space_after=40))
    body_parts.append(code_box("cd ruta/a/plataforma_ojs"))
    body_parts.append(p("3. Ejecute el comando de inicio en segundo plano:", size=21, space_after=40))
    body_parts.append(code_box("docker-compose up -d"))
    body_parts.append(callout_box("Nota de Inicialización", "Durante la primera ejecución, MariaDB cargará automáticamente init.sql. El contenedor de OJS esperará a que la base de datos esté lista antes de recibir peticiones. Este proceso inicial toma entre 15 y 30 segundos."))

    # Paso 4
    body_parts.append(p("Paso 4: Acceso a la Plataforma", size=22, bold=True, color="2B6CB0", space_before=160, space_after=60))
    body_parts.append(p("Una vez iniciado el entorno, abra su navegador web e ingrese a las siguientes direcciones:", size=21, space_after=80))
    body_parts.append(p("• Portada de Revista Ceibo: http://localhost:8080/index.php/revista_ceibo", size=20, bold=True, space_after=30))
    body_parts.append(p("• Acceso y Panel de Administración: http://localhost:8080/index.php/revista_ceibo/login", size=20, bold=True, space_after=30))
    body_parts.append(p("• Cosechador OAI-PMH (Dublin Core): http://localhost:8080/index.php/revista_ceibo/oai?verb=Identify", size=20, bold=True, space_after=140))

    # Paso 5
    body_parts.append(p("Paso 5: Comandos de Administración Frecuentes", size=22, bold=True, color="2B6CB0", space_before=160, space_after=60))
    body_parts.append(p("Detener los contenedores sin perder información:", size=21, space_after=40))
    body_parts.append(code_box("docker-compose stop"))
    body_parts.append(p("Reanudar los contenedores:", size=21, space_after=40))
    body_parts.append(code_box("docker-compose start"))
    body_parts.append(p("Reiniciar desde cero (borrar cambios de prueba y recargar la base de datos inicial):", size=21, space_after=40))
    body_parts.append(code_box("docker-compose down -v && docker-compose up -d"))
    body_parts.append(p("Ver registros de actividad en caso de soporte:", size=21, space_after=40))
    body_parts.append(code_box("docker logs ojs_app\ndocker logs ojs_db"))

    body_xml_str = "".join(body_parts)

    document_xml = f"""<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    {body_xml_str}
    <w:sectPr>
      <w:pgSz w:w="12240" w:h="15840"/>
      <w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440" w:header="720" w:footer="720" w:gutter="0"/>
      <w:cols w:space="720"/>
    </w:sectPr>
  </w:body>
</w:document>"""

    with zipfile.ZipFile(filename, 'w', zipfile.ZIP_DEFLATED) as docx:
        docx.writestr('[Content_Types].xml', content_types)
        docx.writestr('_rels/.rels', rels)
        docx.writestr('word/_rels/document.xml.rels', doc_rels)
        docx.writestr('word/styles.xml', styles_xml)
        docx.writestr('word/document.xml', document_xml)

    print(f"Documento Word generado exitosamente: {filename}")

if __name__ == '__main__':
    create_docx("Guia_Despliegue_Revista_Ceibo.docx")
