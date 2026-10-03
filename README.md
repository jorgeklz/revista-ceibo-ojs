# Plataforma Editorial Revista Científica Ceibo (OJS 3.3.0-8)

Entorno de práctica y formación para la gestión editorial científica con **Open Journal Systems (OJS 3.3.0-8)** y **MariaDB 10.11**.

Diseñado para las asignaturas y talleres de posgrado en gestión editorial:
* Unidad 1: Tecnología y plataformas editoriales.
* Unidad 2: Gestión editorial con OJS y OMP (roles, envíos, revisión por pares).
* Unidad 3: Diseño, edición, maquetación, difusión y publicación de números.

---

## Despliegue Inmediato en la Nube (GitHub Codespaces)

[![Abrir en GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jorgeklz/revista-ceibo-ojs)

Puedes levantar y utilizar la revista directamente en tu navegador sin instalar Docker ni programas en tu computadora:

1. Haz clic en el botón verde **Code** (arriba a la derecha en el repositorio).
2. Selecciona la pestaña **Codespaces** y haz clic en **Create codespace on main**.
3. Espera entre 1 y 2 minutos mientras el entorno se inicializa automáticamente.
4. En cuanto los contenedores inicien, aparecerá una notificación abajo a la derecha:
   * **Open in Browser** (Abrir en el navegador).
5. Si no se abre de forma automática:
   * Ve a la pestaña **Ports** (Puertos) en la barra inferior.
   * Haz clic derecho sobre el puerto **8080** y selecciona **Port Visibility > Public**.
   * Haz clic en el icono del globo terráqueo (Open in Browser) para acceder.

---

## Usuarios y Credenciales del Sistema

Todos los usuarios tienen configurada la misma contraseña de acceso:

> **Contraseña universal para todas las cuentas:** `Ceibo2026*`

### Cuentas y Roles Editoriales

| Usuario | Nombre Completo | Rol Principal en OJS | Correo Institucional |
| :--- | :--- | :--- | :--- |
| `jperez` | Dr. Juan Pérez | **Director / Editor en Jefe y Gestor** | jperez@utm.edu.ec |
| `admin` | Administrador OJS | **Administrador del Sitio / Gestor** | jorge.parraga@utm.edu.ec |
| `smendoza` | Dra. Sofía Mendoza | **Gestora de la Revista** | smendoza@utm.edu.ec |
| `emorales` | MSc. Elena Morales | **Editora de Sección (Ciencias Agrarias)** | emorales@utm.edu.ec |
| `ralarcon` | Dr. Roberto Alarcón | **Editor de Sección (Educación y TIC)** | ralarcon@utm.edu.ec |
| `mgomez` | Dr. Manuel Gómez | **Revisor/a por pares (U. Salamanca)** | mgomez@usal.es |
| `lrestrepo` | Dra. Laura Restrepo | **Revisora por pares (U. Nacional Col.)** | lrestrepo@unal.edu.co |
| `revisor_ceibo` | Dr. Fernando Castro | **Revisor/a por pares (U. Buenos Aires)** | revisor.ceibo@utm.edu.ec |
| `revisor2_ceibo` | Dra. Beatriz Silva | **Revisora por pares (U. São Paulo)** | revisor2.ceibo@utm.edu.ec |
| `jbarreiro` | Ing. Juan Barreiro | **Autor/a de correspondencia** | jbarreiro@gmail.com |
| `autor_ceibo` | Ing. María Gómez | **Autor/a postulante** | autor.ceibo@utm.edu.ec |
| `lector_ceibo` | Lector Ceibo | **Lector/a suscrito** | lector.ceibo@utm.edu.ec |


---

## Ejecución Local en Computadora (Alternativa con Docker Desktop)

Si prefieres ejecutar la plataforma en tu computadora sin conexión a internet:

1. Clona o descarga esta carpeta.
2. Abre la terminal en esta ubicación.
3. Ejecuta el comando:
   ```bash
   docker compose up -d
   ```
4. Abre tu navegador web e ingresa a:
   [http://localhost:8080](http://localhost:8080)
5. Para detener la plataforma cuando termines la práctica:
   ```bash
   docker compose stop
   ```

---

## Características Técnicas Configuradas

* **OJS 3.3.0-8 LTS**: Versión estable con interfaz responsiva, flujo editorial completo y soporte multiidioma (Español configurado por defecto).
* **Parches de Compatibilidad**: Soporte completo para renderizado de citas y referencias bibliográficas sin cortes de caracteres.
* **Galeradas y Artículos Preinstalados**: 9 artículos de ejemplo completos con PDFs accesibles para ejercicios de maquetación y publicación.
