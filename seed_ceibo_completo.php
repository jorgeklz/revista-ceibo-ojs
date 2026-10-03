<?php

/**
 * Script de inicialización completa de Revista Ceibo para OJS 3.3.0
 * Incluye:
 * - Políticas institucionales y equipo editorial completo
 * - Formulario de evaluación por pares con preguntas estructuradas
 * - 3 números publicados (2025 y 2026)
 * - 9 artículos publicados con galeradas PDF
 * - Artículos en flujo editorial activo con Ronda 1 y Ronda 2 con respuestas de formulario
 * - Artículos aceptados, rechazados y enviados
 */

require_once('./tools/bootstrap.inc.php');
import('classes.core.Services');

$application = Application::get();
$request = $application->getRequest();
AppLocale::initialize($request);

$journalDao = DAORegistry::getDAO('JournalDAO');
$userDao = DAORegistry::getDAO('UserDAO');
$userGroupDao = DAORegistry::getDAO('UserGroupDAO');
$issueDao = DAORegistry::getDAO('IssueDAO');
$submissionDao = DAORegistry::getDAO('SubmissionDAO');
$publicationDao = DAORegistry::getDAO('PublicationDAO');
$authorDao = DAORegistry::getDAO('AuthorDAO');
$stageAssignmentDao = DAORegistry::getDAO('StageAssignmentDAO');
$editDecisionDao = DAORegistry::getDAO('EditDecisionDAO');
$reviewRoundDao = DAORegistry::getDAO('ReviewRoundDAO');
$reviewAssignmentDao = DAORegistry::getDAO('ReviewAssignmentDAO');
$rfDao = DAORegistry::getDAO('ReviewFormDAO');
$rfeDao = DAORegistry::getDAO('ReviewFormElementDAO');
$rfrDao = DAORegistry::getDAO('ReviewFormResponseDAO');
$galleyDao = DAORegistry::getDAO('ArticleGalleyDAO');

echo "=== 1. Configurando Información Institucional y Políticas de Revista Ceibo ===" . PHP_EOL;

$journal = $journalDao->getById(1);
if (!$journal) {
    die("Error: No se encontró la revista con ID 1" . PHP_EOL);
}

$journal->setName("Revista Ceibo", "es_ES");
$journal->setName("Ceibo Journal", "en_US");
$journal->setDescription("Revista multidisciplinaria de investigación científica, educación y desarrollo regional de la Universidad Técnica de Manabí.", "es_ES");

$editorialTeamHtml = <<<HTML
<h3>Equipo Editorial</h3>
<p><strong>Director / Editor en Jefe:</strong> Dr. Santiago Quiroz Fernández (Universidad Técnica de Manabí, Ecuador)</p>
<p><strong>Editor Ejecutivo:</strong> Dr. Carlos Zambrano (Universidad Técnica de Manabí, Ecuador)</p>
<p><strong>Gestora Editorial:</strong> Dra. Sofía Mendoza (Universidad Técnica de Manabí, Ecuador)</p>
<p><strong>Editora de Sección de Ciencias Agrícolas y Ambientales:</strong> MSc. Elena Morales (Universidad Técnica de Manabí, Ecuador)</p>
<p><strong>Editor de Sección de Educación y Tecnologías:</strong> Dr. Roberto Alarcón (Universidad Técnica de Manabí, Ecuador)</p>
<hr />
<h3>Comité Científico Internacional</h3>
<ul>
  <li><strong>Dra. Laura Restrepo:</strong> Universidad Nacional de Colombia (Bogotá, Colombia)</li>
  <li><strong>Dr. Manuel Gómez de la Torre:</strong> Universidad de Salamanca (Salamanca, España)</li>
  <li><strong>Dra. Beatriz Silva:</strong> Universidade de São Paulo (São Paulo, Brasil)</li>
  <li><strong>Dr. Andrés Cárdenas:</strong> Universidad Nacional Autónoma de México (Ciudad de México, México)</li>
  <li><strong>Dr. Fernando Castro:</strong> Universidad de Buenos Aires (Buenos Aires, Argentina)</li>
  <li><strong>Dr. Nelson Pinargote:</strong> Universidad Técnica de Manabí (Portoviejo, Ecuador)</li>
</ul>
HTML;

$aboutHtml = <<<HTML
<p>La <strong>Revista Ceibo</strong> es un órgano de difusión científica arbitrado e indexado de la Universidad Técnica de Manabí. Publica artículos de investigación científica originales, revisiones sistemáticas y ensayos de alta rigurosidad metodológica de periodicidad semestral.</p>
<p>La revista se rige por principios de acceso abierto irrestricto, ética en la publicación según directrices de COPE y adopción de identificadores persistentes y metadatos estructurados para facilitar la indización y visibilidad internacional.</p>
HTML;

$focusScopeHtml = <<<HTML
<p>La Revista Ceibo acepta contribuciones inéditas en las siguientes áreas de conocimiento:</p>
<ul>
  <li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo de suelos, cuencas hidrográficas, conservación de ecosistemas tropicales, agroecología y cambio climático.</li>
  <li><strong>Educación, Pedagogía y Sociedad:</strong> Innovación docente, inclusión, mediación tecnológica y políticas educativas en educación superior y media.</li>
  <li><strong>Tecnologías de la Información y Gestión del Conocimiento:</strong> Inteligencia artificial aplicada, repositorios institucionales, ciencia abierta y sistemas informáticos para la gestión editorial.</li>
</ul>
HTML;

$reviewGuidelinesHtml = <<<HTML
<h3>Proceso de Revisión por Pares Doble Ciego</h3>
<p>Todos los manuscritos remitidos a la Revista Ceibo son sometidos a un proceso de evaluación estricto bajo la modalidad de <strong>doble ciego (double-blind peer review)</strong>:</p>
<ol>
  <li><strong>Revisión preliminar (Desk Review):</strong> Evaluación inicial por parte del equipo editorial para verificar pertinencia temática, originalidad mediante software antiplagio y apego a las directrices de presentación (plazo: 10 días).</li>
  <li><strong>Arbitraje por pares especialistas:</strong> Asignación a dos evaluadores externos calificados en el área temática respectiva (plazo de dictamen: 4 a 6 semanas).</li>
  <li><strong>Dictamen y rondas:</strong> El comité editorial analiza los informes de los revisores y emite la resolución:
    <ul>
      <li><em>Aceptado sin modificaciones.</em></li>
      <li><em>Publicable con modificaciones menores.</em></li>
      <li><em>Reevaluable en Segunda Ronda tras modificaciones mayores (Ronda 2).</em></li>
      <li><em>No publicable (Rechazado).</em></li>
    </ul>
  </li>
</ol>
HTML;

$authorGuidelinesHtml = <<<HTML
<h3>Directrices para Autores</h3>
<p>Los manuscritos postulados deben cumplir los siguientes requisitos formales:</p>
<ul>
  <li><strong>Estructura:</strong> Manuscritos bajo esquema IMRyD (Introducción, Metodología, Resultados y Discusión) en formato digital DOCX.</li>
  <li><strong>Extensión:</strong> Entre 5.000 y 8.000 palabras incluyendo referencias bibliográficas.</li>
  <li><strong>Resumen y palabras clave:</strong> Resumen analítico de hasta 250 palabras en español e inglés, con 4 a 6 palabras clave normalizadas en tesauros internacionales (UNESCO).</li>
  <li><strong>Citas y referencias:</strong> Aplicación estricta de normas APA (7ma edición), con indicación obligatoria del identificador DOI en todas las fuentes digitales.</li>
</ul>
HTML;

$licenseTermsHtml = <<<HTML
<p>La Revista Ceibo publica todos sus contenidos bajo la licencia <strong>Creative Commons Atribución-NoComercial 4.0 Internacional (CC BY-NC 4.0)</strong>. Los autores conservan sus derechos morales y ceden a la revista el derecho de primera publicación. No se aplican cargos por procesamiento de artículos (APC) ni por postulación.</p>
HTML;

$competingInterestsHtml = <<<HTML
<p>Los autores, revisores y editores deben declarar explícitamente cualquier vínculo profesional, comercial o financiero que pudiera condicionar la objetividad del manuscrito o de su proceso de evaluación.</p>
HTML;

// Guardar en journal_settings
$journalSettingsDao = DAORegistry::getDAO('JournalSettingsDAO');
$settingsToUpdate = [
    'editorialTeam' => $editorialTeamHtml,
    'about' => $aboutHtml,
    'focusScope' => $focusScopeHtml,
    'reviewGuidelines' => $reviewGuidelinesHtml,
    'authorGuidelines' => $authorGuidelinesHtml,
    'licenseTerms' => $licenseTermsHtml,
    'competingInterests' => $competingInterestsHtml,
];

foreach ($settingsToUpdate as $key => $val) {
    $journalSettingsDao->updateSetting(1, $key, $val, 'string', true);
}
$journalDao->updateObject($journal);

echo "Información institucional y políticas guardadas." . PHP_EOL;

// 2. Crear usuarios y roles
echo "=== 2. Configurando Usuarios y Roles ===" . PHP_EOL;
$usersData = [
    ['username' => 'gestor_ceibo', 'email' => 'gestor.ceibo@utm.edu.ec', 'givenName' => 'Sofía', 'familyName' => 'Mendoza', 'groups' => [2]],
    ['username' => 'editor_ceibo', 'email' => 'editor.ceibo@utm.edu.ec', 'givenName' => 'Carlos', 'familyName' => 'Zambrano', 'groups' => [3]],
    ['username' => 'seccion_ceibo', 'email' => 'seccion.ceibo@utm.edu.ec', 'givenName' => 'Elena', 'familyName' => 'Morales', 'groups' => [5]],
    ['username' => 'revisor_ceibo', 'email' => 'revisor.ceibo@utm.edu.ec', 'givenName' => 'Fernando', 'familyName' => 'Castro', 'groups' => [16]],
    ['username' => 'revisor2_ceibo', 'email' => 'revisor2.ceibo@utm.edu.ec', 'givenName' => 'Beatriz', 'familyName' => 'Silva', 'groups' => [16]],
    ['username' => 'autor_ceibo', 'email' => 'autor.ceibo@utm.edu.ec', 'givenName' => 'María', 'familyName' => 'Gómez', 'groups' => [14]],
    ['username' => 'lector_ceibo', 'email' => 'lector.ceibo@utm.edu.ec', 'givenName' => 'Juan', 'familyName' => 'Pérez', 'groups' => [17]],
];

$userMap = [];
$admin = $userDao->getByUsername('admin');
if ($admin) {
    $userGroupDao->assignUserToGroup($admin->getId(), 2);
    $userGroupDao->assignUserToGroup($admin->getId(), 3);
    $userMap['admin'] = $admin->getId();
}

foreach ($usersData as $uData) {
    $existing = $userDao->getByUsername($uData['username']);
    if ($existing) {
        $userId = $existing->getId();
    } else {
        $newUser = $userDao->newDataObject();
        $newUser->setUsername($uData['username']);
        $newUser->setPassword(Validation::encryptCredentials($uData['username'], 'password123'));
        $newUser->setEmail($uData['email']);
        $newUser->setGivenName($uData['givenName'], 'es_ES');
        $newUser->setFamilyName($uData['familyName'], 'es_ES');
        $userId = $userDao->insertObject($newUser);
    }
    $userMap[$uData['username']] = $userId;
    foreach ($uData['groups'] as $groupId) {
        $userGroupDao->assignUserToGroup($userId, $groupId);
    }
}
echo "Usuarios configurados con contraseña 'password123'." . PHP_EOL;

// 3. Crear Formulario de Evaluación Oficial
echo "=== 3. Creando Formulario de Evaluación por Pares ===" . PHP_EOL;
$rf = $rfDao->newDataObject();
$rf->setAssocType(ASSOC_TYPE_JOURNAL);
$rf->setAssocId(1);
$rf->setActive(1);
$rf->setSequence(1);
$rf->setTitle("Formulario Oficial de Arbitraje por Pares Ciegos - Revista Ceibo", "es_ES");
$rf->setDescription("Formulario oficial para el dictamen y evaluación de calidad científica, originalidad y rigor metodológico de manuscritos postulados a Revista Ceibo.", "es_ES");
$rfId = $rfDao->insertObject($rf);

// Preguntas del formulario
$preguntas = [
    [
        'tipo' => REVIEW_FORM_ELEMENT_TYPE_RADIO_BUTTONS,
        'requerido' => 1,
        'texto' => "Originalidad y pertinencia científica:",
        'opciones' => ["Excelente (Aporte novedoso y relevante)", "Bueno (Contribución pertinente con sustento adecuado)", "Regular (Aporte limitado)", "Deficiente (Sin novedad científica)"]
    ],
    [
        'tipo' => REVIEW_FORM_ELEMENT_TYPE_RADIO_BUTTONS,
        'requerido' => 1,
        'texto' => "Rigor metodológico y diseño experimental:",
        'opciones' => ["Excelente (Metodología reproducible y robusta)", "Bueno (Diseño adecuado con detalles menores a precisar)", "Regular (Deficiencias metodológicas subsanables)", "Deficiente (Metodología no válida)"]
    ],
    [
        'tipo' => REVIEW_FORM_ELEMENT_TYPE_RADIO_BUTTONS,
        'requerido' => 1,
        'texto' => "Claridad en la exposición, figuras y tablas:",
        'opciones' => ["Excelente", "Bueno", "Aceptable", "Deficiente"]
    ],
    [
        'tipo' => REVIEW_FORM_ELEMENT_TYPE_TEXTAREA,
        'requerido' => 1,
        'texto' => "Comentarios constructivos y observaciones específicas para los autores:",
        'opciones' => []
    ],
    [
        'tipo' => REVIEW_FORM_ELEMENT_TYPE_TEXTAREA,
        'requerido' => 0,
        'texto' => "Comentarios confidenciales dirigidos exclusivamente al Comité Editorial:",
        'opciones' => []
    ]
];

$elementIds = [];
$seq = 1;
foreach ($preguntas as $p) {
    $elem = $rfeDao->newDataObject();
    $elem->setReviewFormId($rfId);
    $elem->setSequence($seq++);
    $elem->setElementType($p['tipo']);
    $elem->setRequired($p['requerido']);
    $elem->setIncluded(1);
    $elem->setQuestion($p['texto'], 'es_ES');
    if (!empty($p['opciones'])) {
        $possibleResponses = [];
        foreach ($p['opciones'] as $op) {
            $possibleResponses[] = ['content' => $op];
        }
        $elem->setPossibleResponses($possibleResponses, 'es_ES');
    }
    $elId = $rfeDao->insertObject($elem);
    $elementIds[] = $elId;
}
echo "Formulario de evaluación creado (ID: $rfId) con " . count($elementIds) . " elementos." . PHP_EOL;

// 4. Crear 3 Números (Issues)
echo "=== 4. Creando Números de la Revista (Issues) ===" . PHP_EOL;

function crearNumero($vol, $num, $year, $titulo, $descripcion, $fechaPub, $current = 0) {
    global $issueDao;
    $issue = $issueDao->newDataObject();
    $issue->setJournalId(1);
    $issue->setVolume($vol);
    $issue->setNumber($num);
    $issue->setYear($year);
    $issue->setShowVolume(1);
    $issue->setShowNumber(1);
    $issue->setShowYear(1);
    $issue->setShowTitle(1);
    $issue->setTitle($titulo, "es_ES");
    $issue->setDescription($descripcion, "es_ES");
    $issue->setPublished(1);
    $issue->setCurrent($current);
    $issue->setDatePublished($fechaPub);
    $issue->setAccessStatus(ISSUE_ACCESS_OPEN);
    $issueId = $issueDao->insertObject($issue);
    return $issueId;
}

$issue1 = crearNumero(1, 1, 2025, "Vol. 1 Núm. 1 (2025): Fundamentos y Perspectivas del Desarrollo Regional", "Número inaugural dedicado al estudio de los sectores productivos, dinámicas territoriales y patrimonio cultural regional.", "2025-06-30 00:00:00", 0);

$issue2 = crearNumero(1, 2, 2025, "Vol. 1 Núm. 2 (2025): Innovación Educativa y Tecnologías Emergentes", "Edición semestral enfocada en la transformación digital, entornos de aprendizaje virtual y gestión editorial en educación superior.", "2025-12-15 00:00:00", 0);

$issue3 = crearNumero(2, 1, 2026, "Vol. 2 Núm. 1 (2026): Sostenibilidad, Biodiversidad y Políticas Editoriales", "Número actual de Revista Ceibo con investigaciones sobre ecosistemas tropicales, agroindustria circular y modelos de ciencia abierta.", "2026-03-15 00:00:00", 1);

echo "Números creados: Issue 1 (Vol 1 No 1 2025), Issue 2 (Vol 1 No 2 2025), Issue 3 (Vol 2 No 1 2026 Actual)." . PHP_EOL;

// Función para registrar un artículo completo
function registrarArticulo(
    $titulo,
    $resumen,
    $autorNombre,
    $autorApellido,
    $autorEmail,
    $status,
    $stageId,
    $issueId = null,
    $fechaPub = null,
    $paginas = "1-15",
    $galleyLabel = null
) {
    global $submissionDao, $publicationDao, $authorDao, $stageAssignmentDao, $galleyDao, $userMap;
    $now = Core::getCurrentDate();

    $sub = $submissionDao->newDataObject();
    $sub->setData('contextId', 1);
    $sub->setData('locale', 'es_ES');
    $sub->setData('submissionProgress', 0);
    $sub->setData('stageId', $stageId);
    $sub->setData('status', $status);
    $sub->setData('dateSubmitted', $fechaPub ? $fechaPub : $now);
    $sub->setData('dateLastActivity', $now);
    $subId = $submissionDao->insertObject($sub);

    $pub = $publicationDao->newDataObject();
    $pub->setData('submissionId', $subId);
    $pub->setData('status', $status);
    $pub->setData('version', 1);
    $pub->setData('sectionId', 1);
    $pub->setData('locale', 'es_ES');
    $pub->setData('title', $titulo, 'es_ES');
    $pub->setData('abstract', $resumen, 'es_ES');
    if ($issueId) {
        $pub->setData('issueId', $issueId);
        $pub->setData('datePublished', $fechaPub ? $fechaPub : $now);
        $pub->setData('pages', $paginas);
    }
    $pubId = $publicationDao->insertObject($pub);

    $author = $authorDao->newDataObject();
    $author->setData('publicationId', $pubId);
    $author->setData('givenName', $autorNombre, 'es_ES');
    $author->setData('familyName', $autorApellido, 'es_ES');
    $author->setData('email', $autorEmail);
    $author->setData('userGroupId', 14);
    $author->setData('includeInBrowse', 1);
    $authorId = $authorDao->insertObject($author);

    $pub->setData('primaryContactId', $authorId);
    $publicationDao->updateObject($pub);

    $sub->setData('currentPublicationId', $pubId);
    $submissionDao->updateObject($sub);

    // Asignar autor y editor a las etapas
    $autorUserId = $userMap['autor_ceibo'] ?? 1;
    $editorUserId = $userMap['editor_ceibo'] ?? 1;

    $assignAuthor = $stageAssignmentDao->newDataObject();
    $assignAuthor->setSubmissionId($subId);
    $assignAuthor->setUserGroupId(14);
    $assignAuthor->setUserId($autorUserId);
    $assignAuthor->setDateAssigned($now);
    $stageAssignmentDao->insertObject($assignAuthor);

    $assignEditor = $stageAssignmentDao->newDataObject();
    $assignEditor->setSubmissionId($subId);
    $assignEditor->setUserGroupId(3);
    $assignEditor->setUserId($editorUserId);
    $assignEditor->setDateAssigned($now);
    $stageAssignmentDao->insertObject($assignEditor);

    if ($galleyLabel) {
        $galley = $galleyDao->newDataObject();
        $galley->setData('publicationId', $pubId);
        $galley->setData('locale', 'es_ES');
        $galley->setData('label', $galleyLabel);
        $galley->setData('seq', 1);
        $galley->setData('isApproved', true);
        $galley->setData('urlRemote', 'https://revistas.utm.edu.ec/sample_articulo.pdf');
        $galleyDao->insertObject($galley);
    }

    return [$subId, $pubId];
}

// 5. Crear 9 Artículos Publicados en los 3 Números con Galeradas PDF
echo "=== 5. Creando Artículos Publicados en los 3 Números con Galeradas PDF ===" . PHP_EOL;

$articulosPublicados = [
    // Número 1 (2025)
    [
        'issue' => $issue1, 'fecha' => '2025-06-30', 'pag' => '1-14',
        'titulo' => "Desarrollo territorial y cadenas de valor agroalimentarias en la costa ecuatoriana",
        'resumen' => "Investigación empírica que examina la articulación de los pequeños productores de plátano y cacao en la provincia de Manabí, identificando cuellos de botella en la logística intermedia y proponiendo modelos de asociatividad sustentable.",
        'nombre' => "Carmen", 'apellido' => "Holguín", 'email' => "carmen.holguin@utm.edu.ec"
    ],
    [
        'issue' => $issue1, 'fecha' => '2025-06-30', 'pag' => '15-28',
        'titulo' => "Patrimonio cultural inmaterial y memoria oral en comunidades rurales de Manabí",
        'resumen' => "Estudio etnográfico que documenta saberes ancestrales en la alfarería tradicional y gastronomía montuvia, proponiendo lineamientos para la salvaguardia patrimonial comunitaria.",
        'nombre' => "Gonzalo", 'apellido' => "Mendoza", 'email' => "gonzalo.mendoza@utm.edu.ec"
    ],
    [
        'issue' => $issue1, 'fecha' => '2025-06-30', 'pag' => '29-42',
        'titulo' => "Gestión de recursos hídricos superficiales y resiliencia ante eventos hidroclimáticos extremos",
        'resumen' => "Evaluación hidrológica de la microcuenca alta del río Chico frente a oscilaciones de precipitación, modelando escenarios de recarga de acuíferos y mitigación de inundaciones.",
        'nombre' => "Xavier", 'apellido' => "Bravo", 'email' => "xavier.bravo@utm.edu.ec"
    ],
    // Número 2 (2025)
    [
        'issue' => $issue2, 'fecha' => '2025-12-15', 'pag' => '1-16',
        'titulo' => "Estrategias de gamificación aplicadas a la enseñanza de matemáticas en el bachillerato",
        'resumen' => "Experimento cuasiexperimental implementado en cuatro instituciones fiscales para medir la motivación y el rendimiento académico en álgebra mediante plataformas interactivas gamificadas.",
        'nombre' => "Diana", 'apellido' => "Villacreses", 'email' => "diana.villacreses@utm.edu.ec"
    ],
    [
        'issue' => $issue2, 'fecha' => '2025-12-15', 'pag' => '17-31',
        'titulo' => "Competencias digitales docentes y entornos virtuales en la educación superior pública",
        'resumen' => "Diagnóstico sobre los niveles de dominio en diseño instruccional digital en el cuerpo docente universitario, planteando programas de capacitación continua basados en marcos internacionales.",
        'nombre' => "Jorge", 'apellido' => "Lucas", 'email' => "jorge.lucas@utm.edu.ec"
    ],
    [
        'issue' => $issue2, 'fecha' => '2025-12-15', 'pag' => '32-45',
        'titulo' => "Ecosistemas de aprendizaje abierto y plataformas colaborativas en la formación médica",
        'resumen' => "Revisión sobre la adopción de recursos educativos abiertos y simuladores clínicos virtuales en facultades de ciencias de la salud en el contexto postpandemia.",
        'nombre' => "Teresa", 'apellido' => "Anchundia", 'email' => "teresa.anchundia@utm.edu.ec"
    ],
    // Número 3 (2026 - Actual)
    [
        'issue' => $issue3, 'fecha' => '2026-03-15', 'pag' => '1-18',
        'titulo' => "Biodiversidad y conservación del bosque seco tropical en la provincia de Manabí",
        'resumen' => "Este trabajo analiza la flora y fauna representativa de los remanentes de bosque seco tropical en la región central de Manabí, proponiendo estrategias de conservación comunitaria y corredores biológicos.",
        'nombre' => "María", 'apellido' => "Gómez", 'email' => "maria.gomez@utm.edu.ec"
    ],
    [
        'issue' => $issue3, 'fecha' => '2026-03-15', 'pag' => '19-33',
        'titulo' => "Microplásticos en ecosistemas estuarinos y su impacto en comunidades de macroinvertebrados",
        'resumen' => "Monitoreo cuantitativo de microplásticos suspendidos en el estuario del río Chone y su correlación con la bioacumulación en especies bentónicas de interés pesquero y ambiental.",
        'nombre' => "Nelson", 'apellido' => "Pinargote", 'email' => "nelson.pinargote@utm.edu.ec"
    ],
    [
        'issue' => $issue3, 'fecha' => '2026-03-15', 'pag' => '34-48',
        'titulo' => "Economía circular y aprovechamiento de biomasa residual en la agroindustria cacaotera",
        'resumen' => "Propuesta de valorización de la cascarilla de cacao para la elaboración de bioinsumos agrícolas y absorbentes industriales, evaluando viabilidad técnica, ambiental y financiera.",
        'nombre' => "Fabiola", 'apellido' => "Delgado", 'email' => "fabiola.delgado@utm.edu.ec"
    ],
];

foreach ($articulosPublicados as $art) {
    list($sId, $pId) = registrarArticulo(
        $art['titulo'],
        $art['resumen'],
        $art['nombre'],
        $art['apellido'],
        $art['email'],
        STATUS_PUBLISHED,
        5, // Production
        $art['issue'],
        $art['fecha'],
        $art['pag'],
        'PDF'
    );
    echo "Artículo Publicado registrado: ID $sId (Issue {$art['issue']}) con galerada PDF." . PHP_EOL;
}

// 6. Artículos en Flujo Editorial Activo con Ronda 1 y Ronda 2 y Formularios
echo "=== 6. Creando Artículos en Flujo Editorial con Rondas 1 y 2 ===" . PHP_EOL;

$now = Core::getCurrentDate();
$editorUserId = $userMap['editor_ceibo'] ?? 1;
$revisor1Id = $userMap['revisor_ceibo'] ?? 1;
$revisor2Id = $userMap['revisor2_ceibo'] ?? 1;

// ARTÍCULO EN RONDA 2:
// Manuscrito que pasó Ronda 1 (con solicitud de modificaciones) y se encuentra en Ronda 2
list($subR2Id, $pubR2Id) = registrarArticulo(
    "Modelado predictivo de erosión hídrica en suelos agrícolas de la cuenca media del río Carrizal",
    "Aplicación de ecuaciones universales de pérdida de suelo (RUSLE) integradas con sistemas de información geográfica para identificar zonas de alta vulnerabilidad a la degradación hídrica.",
    "Jorge",
    "Cedeño",
    "jorge.cedeno@utm.edu.ec",
    STATUS_QUEUED,
    WORKFLOW_STAGE_ID_EXTERNAL_REVIEW
);

// Ronda 1: Finalizada con decisión de modificaciones mayores
$rr1 = $reviewRoundDao->build($subR2Id, WORKFLOW_STAGE_ID_EXTERNAL_REVIEW, 1, 5); // Status 5 = reviews completed

// Asignación de revisor 1 en Ronda 1 con formulario
$rev1_R1 = $reviewAssignmentDao->newDataObject();
$rev1_R1->setSubmissionId($subR2Id);
$rev1_R1->setReviewerId($revisor1Id);
$rev1_R1->setReviewRoundId($rr1->getId());
$rev1_R1->setStageId(WORKFLOW_STAGE_ID_EXTERNAL_REVIEW);
$rev1_R1->setRound(1);
$rev1_R1->setReviewMethod(1);
$rev1_R1->setReviewFormId($rfId);
$rev1_R1->setDateAssigned("2026-01-10 10:00:00");
$rev1_R1->setDateConfirmed("2026-01-11 15:30:00");
$rev1_R1->setDateCompleted("2026-01-25 18:00:00");
$rev1_R1->setRecommendation(2); // Revisions Required (Modificaciones mayores)
$reviewAssignmentDao->insertObject($rev1_R1);
$rev1_R1_id = $rev1_R1->getId();

// Llenar respuestas del formulario de revisión en Ronda 1
$respuestasR1 = [
    $elementIds[0] => "Bueno (Contribución pertinente con sustento adecuado)",
    $elementIds[1] => "Regular (Deficiencias metodológicas subsanables)",
    $elementIds[2] => "Bueno",
    $elementIds[3] => "El trabajo es valioso y de gran pertinencia para la cuenca del Carrizal. No obstante, se requiere detallar mejor la calibración de los factores R y K en la metodología y actualizar la cartografía de pendientes a una escala más precisa.",
    $elementIds[4] => "El manuscrito tiene potencial pero amerita una segunda revisión tras corregir la calibración metodológica."
];

foreach ($respuestasR1 as $eId => $valor) {
    $resp = $rfrDao->newDataObject();
    $resp->setReviewId($rev1_R1_id);
    $resp->setReviewFormElementId($eId);
    $resp->setResponseType('string');
    $resp->setValue($valor);
    $rfrDao->insertObject($resp);
}

// Decisión editorial de Ronda 1: Modificaciones requeridas
$decisionR1 = [
    'editDecisionId' => null,
    'editorId' => $editorUserId,
    'decision' => 2, // SUBMISSION_EDITOR_DECISION_PENDING_REVISIONS
    'dateDecided' => "2026-01-28 11:00:00"
];
$editDecisionDao->updateEditorDecision($subR2Id, $decisionR1, WORKFLOW_STAGE_ID_EXTERNAL_REVIEW, $rr1);

// Ronda 2: Iniciada tras el reenvío de versión corregida
$rr2 = $reviewRoundDao->build($subR2Id, WORKFLOW_STAGE_ID_EXTERNAL_REVIEW, 2, 5); // Status 5 = reviews completed in round 2

$rev1_R2 = $reviewAssignmentDao->newDataObject();
$rev1_R2->setSubmissionId($subR2Id);
$rev1_R2->setReviewerId($revisor1Id);
$rev1_R2->setReviewRoundId($rr2->getId());
$rev1_R2->setStageId(WORKFLOW_STAGE_ID_EXTERNAL_REVIEW);
$rev1_R2->setRound(2);
$rev1_R2->setReviewMethod(1);
$rev1_R2->setReviewFormId($rfId);
$rev1_R2->setDateAssigned("2026-02-15 09:00:00");
$rev1_R2->setDateConfirmed("2026-02-16 11:00:00");
$rev1_R2->setDateCompleted("2026-03-01 16:30:00");
$rev1_R2->setRecommendation(1); // Accept Submission
$reviewAssignmentDao->insertObject($rev1_R2);
$rev1_R2_id = $rev1_R2->getId();

// Llenar respuestas del formulario de revisión en Ronda 2
$respuestasR2 = [
    $elementIds[0] => "Excelente (Aporte novedoso y relevante)",
    $elementIds[1] => "Excelente (Metodología reproducible y robusta)",
    $elementIds[2] => "Excelente",
    $elementIds[3] => "Los autores atendieron satisfactoriamente todas las observaciones de la primera ronda. La calibración de los factores RUSLE quedó rigurosamente sustentada y las nuevas figuras cartográficas aportan gran claridad.",
    $elementIds[4] => "El artículo está listo para ser aceptado en su versión revisada."
];

foreach ($respuestasR2 as $eId => $valor) {
    $resp = $rfrDao->newDataObject();
    $resp->setReviewId($rev1_R2_id);
    $resp->setReviewFormElementId($eId);
    $resp->setResponseType('string');
    $resp->setValue($valor);
    $rfrDao->insertObject($resp);
}

echo "Artículo en Ronda 1 y Ronda 2 con respuestas de formulario creado (ID: $subR2Id)." . PHP_EOL;

// ARTÍCULO EN RONDA 1 ACTIVA:
list($subR1Id, $pubR1Id) = registrarArticulo(
    "Impacto del cambio climático en los cultivos de maíz y café en la cuenca del río Portoviejo",
    "Evaluación de series temporales de precipitación y temperatura (2010-2025) y su correlación con el rendimiento agronómico en pequeños y medianos productores agrícolas de la provincia de Manabí.",
    "Andrea",
    "Vera",
    "andrea.vera@utm.edu.ec",
    STATUS_QUEUED,
    WORKFLOW_STAGE_ID_EXTERNAL_REVIEW
);

$rrR1Activa = $reviewRoundDao->build($subR1Id, WORKFLOW_STAGE_ID_EXTERNAL_REVIEW, 1, 5);

$revActiva = $reviewAssignmentDao->newDataObject();
$revActiva->setSubmissionId($subR1Id);
$revActiva->setReviewerId($revisor2Id);
$revActiva->setReviewRoundId($rrR1Activa->getId());
$revActiva->setStageId(WORKFLOW_STAGE_ID_EXTERNAL_REVIEW);
$revActiva->setRound(1);
$revActiva->setReviewMethod(1);
$revActiva->setReviewFormId($rfId);
$revActiva->setDateAssigned("2026-03-01 10:00:00");
$revActiva->setDateConfirmed("2026-03-02 12:00:00");
$revActiva->setDateCompleted("2026-03-20 17:00:00");
$revActiva->setRecommendation(1); // Accept Submission
$reviewAssignmentDao->insertObject($revActiva);
$revActivaId = $revActiva->getId();

$respuestasActiva = [
    $elementIds[0] => "Excelente (Aporte novedoso y relevante)",
    $elementIds[1] => "Bueno (Diseño adecuado con detalles menores a precisar)",
    $elementIds[2] => "Bueno",
    $elementIds[3] => "Investigación muy pertinente para la realidad agropecuaria de Portoviejo. Se recomienda armonizar las conclusiones con los intervalos de confianza reportados en las tablas 2 y 4.",
    $elementIds[4] => "Aceptable con mejoras mínimas de redacción en conclusiones."
];

foreach ($respuestasActiva as $eId => $valor) {
    $resp = $rfrDao->newDataObject();
    $resp->setReviewId($revActivaId);
    $resp->setReviewFormElementId($eId);
    $resp->setResponseType('string');
    $resp->setValue($valor);
    $rfrDao->insertObject($resp);
}

echo "Artículo en Ronda 1 activa con formulario completado creado (ID: $subR1Id)." . PHP_EOL;

// ARTÍCULO ACEPTADO (En etapa de edición / maquetación):
list($subAcepId, $pubAcepId) = registrarArticulo(
    "Gestión editorial universitaria y políticas de acceso abierto en América Latina",
    "Se revisan las tendencias actuales de indización, interoperabilidad con OAI-PMH y sostenibilidad de las revistas científicas gestionadas con Open Journal Systems en instituciones de educación superior.",
    "Roberto",
    "Alarcón",
    "roberto.alarcon@utm.edu.ec",
    STATUS_QUEUED,
    WORKFLOW_STAGE_ID_EDITING
);
$decisionAcep = [
    'editDecisionId' => null,
    'editorId' => $editorUserId,
    'decision' => 1, // SUBMISSION_EDITOR_DECISION_ACCEPT
    'dateDecided' => $now
];
$editDecisionDao->updateEditorDecision($subAcepId, $decisionAcep, WORKFLOW_STAGE_ID_EXTERNAL_REVIEW, null);
echo "Artículo Aceptado (En edición) creado (ID: $subAcepId)." . PHP_EOL;

// ARTÍCULO RECHAZADO:
list($subRechId, $pubRechId) = registrarArticulo(
    "Análisis preliminar de tecnologías blockchain aplicadas a sistemas de bibliotecas escolares",
    "Estudio exploratorio sobre la viabilidad técnica y económica del uso de contratos inteligentes para el préstamo interbibliotecario en centros de educación básica.",
    "Pedro",
    "Moreira",
    "pedro.moreira@utm.edu.ec",
    STATUS_DECLINED,
    WORKFLOW_STAGE_ID_SUBMISSION
);
$decisionRech = [
    'editDecisionId' => null,
    'editorId' => $editorUserId,
    'decision' => 9, // SUBMISSION_EDITOR_DECISION_INITIAL_DECLINE
    'dateDecided' => $now
];
$editDecisionDao->updateEditorDecision($subRechId, $decisionRech, WORKFLOW_STAGE_ID_SUBMISSION, null);
echo "Artículo Rechazado creado (ID: $subRechId)." . PHP_EOL;

// ARTÍCULO ENVIADO (Nuevo sin evaluar):
list($subEnvId, $pubEnvId) = registrarArticulo(
    "Inteligencia artificial aplicada a la revisión por pares: oportunidades y dilemas éticos",
    "Un análisis crítico sobre el rol de los modelos de lenguaje de gran escala en la redacción, síntesis y dictamen de manuscritos científicos, proponiendo directrices éticas para evaluadores y comités editoriales.",
    "Patricia",
    "Solórzano",
    "patricia.solorzano@utm.edu.ec",
    STATUS_QUEUED,
    WORKFLOW_STAGE_ID_SUBMISSION
);
echo "Artículo Enviado (Pendiente de evaluación) creado (ID: $subEnvId)." . PHP_EOL;

echo "=== 7. Reconstruyendo Índice de Búsqueda ===" . PHP_EOL;
passthru('php tools/rebuildSearchIndex.php');

echo "=== Se completó la inicialización maestra de Revista Ceibo exitosamente ===" . PHP_EOL;
