# RAP Course App
Este repositorio contiene objetos ABAP de una app RAP para gestión de cursos.

# 📘 RAP Course Management App

Este repositorio contiene los objetos ABAP versionados con abapGit para una aplicación basada en el modelo RAP (ABAP RESTful Application Programming Model) enfocada en la gestión de cursos.

## 📁 Estructura de Objetos

### 🧱 Entidades base (Tablas)

| Tipo        | Archivo                                                   | Descripción                     |
|-------------|-----------------------------------------------------------|---------------------------------|
| Tabla       | [zdr_course.tabl.xml](src/zdr_course.tabl.xml)            | Tabla base de cursos            |
| Tabla       | [zdr_course_d.tabl.xml](src/zdr_course_d.tabl.xml)        | Texto de cursos (draft)         |
| Tabla       | [zdr_content.tabl.xml](src/zdr_content.tabl.xml)          | Tabla base de contenidos        |
| Tabla       | [zdr_content_d.tabl.xml](src/zdr_content_d.tabl.xml)      | Texto de contenidos (draft)     |
| Tabla       | [zdr_employee.tabl.xml](src/zdr_employee.tabl.xml)        | Tabla base de empleados         |
| Tabla       | [zdr_employee_d.tabl.xml](src/zdr_employee_d.tabl.xml)    | Texto de empleados (draft)      |
| Tabla       | [zdr_enrollment.tabl.xml](src/zdr_enrollment.tabl.xml)    | Tabla de inscripciones          |
| Tabla       | [zdr_enrollment_d.tabl.xml](src/zdr_enrollment_d.tabl.xml)| Texto de inscripciones (draft)  |

---

### 🧩 CDS Views (Proyecciones y Entidades)

| Tipo        | Archivo                                                    | Descripción                                 |
|-------------|------------------------------------------------------------|---------------------------------------------|
| CDS View    | [zc_dr_course.ddls.asddls](src/zc_dr_course.ddls.asddls)   | Proyección de curso                         |
| CDS View    | [zc_dr_content.ddls.asddls](src/zc_dr_content.ddls.asddls) | Proyección de contenido                     |
| CDS View    | [zc_dr_employee.ddls.asddls](src/zc_dr_employee.ddls.asddls)| Proyección de empleado                      |
| CDS View    | [zc_dr_enrollment.ddls.asddls](src/zc_dr_enrollment.ddls.asddls)| Proyección de inscripción              |
| CDS View    | [zi_dr_course.ddls.asddls](src/zi_dr_course.ddls.asddls)   | Interfaz RAP para curso                     |
| CDS View    | [zi_dr_content.ddls.asddls](src/zi_dr_content.ddls.asddls) | Interfaz RAP para contenido                 |
| CDS View    | [zi_dr_employee.ddls.asddls](src/zi_dr_employee.ddls.asddls)| Interfaz RAP para empleado                  |
| CDS View    | [zi_dr_enrollment.ddls.asddls](src/zi_dr_enrollment.ddls.asddls)| Interfaz RAP para inscripción          |

---

### 🎨 Metadata Extensions

| Tipo        | Archivo                                                    | Descripción                          |
|-------------|------------------------------------------------------------|--------------------------------------|
| Metadata    | [zc_dr_course.ddlx.asddlxs](src/zc_dr_course.ddlx.asddlxs) | Metadata extension para cursos       |
| Metadata    | [zc_dr_content.ddlx.asddlxs](src/zc_dr_content.ddlx.asddlxs)| Metadata extension para contenidos   |
| Metadata    | [zc_dr_employee.ddlx.asddlxs](src/zc_dr_employee.ddlx.asddlxs)| Metadata extension para empleados    |
| Metadata    | [zc_dr_enrollment.ddlx.asddlxs](src/zc_dr_enrollment.ddlx.asddlxs)| Metadata extension para inscripciones|

---

### ⚙️ Behavior Definitions

| Tipo        | Archivo                                                    | Descripción                          |
|-------------|------------------------------------------------------------|--------------------------------------|
| Behavior    | [zc_dr_course.bdef.asbdef](src/zc_dr_course.bdef.asbdef)   | Behavior Definition (Managed)        |
| Behavior    | [zc_dr_employee.bdef.asbdef](src/zc_dr_employee.bdef.asbdef)| Behavior Definition (Managed)        |
| Behavior    | [zi_dr_course.bdef.asbdef](src/zi_dr_course.bdef.asbdef)   | Behavior Projection                  |

---

### 🔧 Clases ABAP (Handlers)

| Tipo        | Archivo                                                    | Descripción                            |
|-------------|------------------------------------------------------------|----------------------------------------|
| Clase       | [zbp_i_dr_course.clas.abap](src/zbp_i_dr_course.clas.abap) | Clase handler de interfaz `I_DR_COURSE`|
| Clase       | [zbp_c_dr_employee.clas.abap](src/zbp_c_dr_employee.clas.abap)| Clase handler de proyección empleado   |

---

### 💬 Mensajes

| Tipo        | Archivo                                         | Descripción                  |
|-------------|-------------------------------------------------|------------------------------|
| Message     | [zmsg_course.msag.xml](src/zmsg_course.msag.xml)| Clase de mensajes RAP        |

---

### 🌐 Servicio OData

| Tipo        | Archivo                                                       | Descripción                         |
|-------------|---------------------------------------------------------------|-------------------------------------|
| Service Def | [zui_dr_course.srvd.srvdsrv](src/zui_dr_course.srvd.srvdsrv) | Definición de servicio RAP          |
| Binding     | [zui_dr_course_o4.srvb.xml](src/zui_dr_course_o4.srvb.xml)   | OData V4 Binding                    |
| Binding     | [zui_dr_course_o4_0001_g4ba.sco2.xml](src/zui_dr_course_o4_0001_g4ba.sco2.xml)| Configuración UI (auto-generada) |

---

### 🔣 Diccionario de datos (Data Elements)

| Tipo        | Archivo                                                | Descripción                  |
|-------------|--------------------------------------------------------|------------------------------|
| Dtel        | [zcostatusdr.dtel.xml](src/zcostatusdr.dtel.xml)       | Elemento de datos (estatus)  |
| Dtel        | [zenstatusdr.dtel.xml](src/zenstatusdr.dtel.xml)       | Elemento de datos (estatus)  |

---

## 🚀 Cómo usar este repositorio

1. Tener abapGit instalado en tu sistema ABAP (BTP o on-prem).
2. Clonar este repositorio desde GitHub en un paquete local (ej. `$TMP`).
3. Ejecutar *Pull* desde abapGit.
4. Activar todos los objetos.
5. Ejecutar el servicio desde SAP Fiori o Postman si está publicado vía OData.

---

## 📎 Notas

- Este repositorio fue generado automáticamente con abapGit desde un entorno SAP BTP Trial.
- Estructura plana mantenida para compatibilidad con reimportación automática.
