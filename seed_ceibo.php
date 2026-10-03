<?php

/**
 * Script de inicialización de datos para Revista Ceibo en OJS 3.3.0
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

echo "=== Configurando Revista Ceibo ===" . PHP_EOL;

$journal = $journalDao->getById(1);
if (!$journal) {
    die("Error: No se encontró la revista con ID 1" . PHP_EOL);
}

// Asegurar nombres y descripción en español e inglés
$journal->setName("Revista Ceibo", "es_ES");
$journal->setDescription("Revista multidisciplinaria de investigación científica, educación y desarrollo regional de la Universidad Técnica de Manabí.", "es_ES");
$journal->setName("Ceibo Journal", "en_US");
$journal->setDescription("Multidisciplinary scientific research journal of the Universidad Tecnica de Manabi.", "en_US");
$journalDao->updateObject($journal);

echo "Revista Ceibo configurada." . PHP_EOL;

// 1. Crear o actualizar usuarios con sus respectivos roles
$usersData = [
    [
        'username' => 'gestor_ceibo',
        'email' => 'gestor.ceibo@utm.edu.ec',
        'givenName' => 'Sofía',
        'familyName' => 'Mendoza',
        'groups' => [2] // Gestor/a de la revista
    ],
    [
        'username' => 'editor_ceibo',
        'email' => 'editor.ceibo@utm.edu.ec',
        'givenName' => 'Carlos',
        'familyName' => 'Zambrano',
        'groups' => [3] // Editor/a de la revista
    ],
    [
        'username' => 'seccion_ceibo',
        'email' => 'seccion.ceibo@utm.edu.ec',
        'givenName' => 'Elena',
        'familyName' => 'Morales',
        'groups' => [5] // Editor/a de sección
    ],
    [
        'username' => 'revisor_ceibo',
        'email' => 'revisor.ceibo@utm.edu.ec',
        'givenName' => 'Fernando',
        'familyName' => 'Castro',
        'groups' => [16] // Revisor/a
    ],
    [
        'username' => 'autor_ceibo',
        'email' => 'autor.ceibo@utm.edu.ec',
        'givenName' => 'María',
        'familyName' => 'Gómez',
        'groups' => [14] // Autor/a
    ],
    [
        'username' => 'lector_ceibo',
        'email' => 'lector.ceibo@utm.edu.ec',
        'givenName' => 'Juan',
        'familyName' => 'Pérez',
        'groups' => [17] // Lector/a
    ]
];

$userMap = [];

// Asignar también al usuario admin los roles de Gestor y Editor para facilitar su uso
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
    echo "Usuario " . $uData['username'] . " listo (ID: $userId, Contraseña: password123)" . PHP_EOL;
}

// 2. Crear el Número de la Revista (Issue)
echo "=== Creando Número Inaugural de Revista Ceibo ===" . PHP_EOL;
$issue = $issueDao->newDataObject();
$issue->setJournalId(1);
$issue->setVolume(1);
$issue->setNumber(1);
$issue->setYear(2026);
$issue->setShowVolume(1);
$issue->setShowNumber(1);
$issue->setShowYear(1);
$issue->setShowTitle(1);
$issue->setTitle("Vol. 1 Núm. 1 (2026): Número Inaugural", "es_ES");
$issue->setDescription("Primer número oficial de la Revista Ceibo, enfocado en investigaciones interdisciplinarias, ciencia, educación y desarrollo regional.", "es_ES");
$issue->setPublished(1);
$issue->setCurrent(1);
$issue->setDatePublished(Core::getCurrentDate());
$issue->setAccessStatus(ISSUE_ACCESS_OPEN);
$issueId = $issueDao->insertObject($issue);
echo "Número creado con ID: $issueId" . PHP_EOL;

// 3. Crear Artículos en cada fase del flujo editorial

function crearArticulo(
    $titulo,
    $resumen,
    $autorNombre,
    $autorApellido,
    $autorEmail,
    $status,
    $stageId,
    $issueId = null,
    $decision = null,
    $conRevisor = false,
    $userMap = []
) {
    global $submissionDao, $publicationDao, $authorDao, $stageAssignmentDao, $editDecisionDao, $reviewRoundDao, $reviewAssignmentDao;

    $now = Core::getCurrentDate();

    // 1. Submission
    $sub = $submissionDao->newDataObject();
    $sub->setData('contextId', 1);
    $sub->setData('locale', 'es_ES');
    $sub->setData('submissionProgress', 0);
    $sub->setData('stageId', $stageId);
    $sub->setData('status', $status);
    $sub->setData('dateSubmitted', $now);
    $sub->setData('dateLastActivity', $now);
    $subId = $submissionDao->insertObject($sub);

    // 2. Publication
    $pub = $publicationDao->newDataObject();
    $pub->setData('submissionId', $subId);
    $pub->setData('status', $status);
    $pub->setData('version', 1);
    $pub->setData('sectionId', 1); // Artículos
    $pub->setData('locale', 'es_ES');
    $pub->setData('title', $titulo, 'es_ES');
    $pub->setData('abstract', $resumen, 'es_ES');
    if ($issueId) {
        $pub->setData('issueId', $issueId);
        $pub->setData('datePublished', $now);
        $pub->setData('pages', '1-15');
    }
    $pubId = $publicationDao->insertObject($pub);

    // 3. Author
    $author = $authorDao->newDataObject();
    $author->setData('publicationId', $pubId);
    $author->setData('givenName', $autorNombre, 'es_ES');
    $author->setData('familyName', $autorApellido, 'es_ES');
    $author->setData('email', $autorEmail);
    $author->setData('userGroupId', 14); // Autor/a
    $author->setData('includeInBrowse', 1);
    $authorId = $authorDao->insertObject($author);

    $pub->setData('primaryContactId', $authorId);
    $publicationDao->updateObject($pub);

    $sub->setData('currentPublicationId', $pubId);
    $submissionDao->updateObject($sub);

    // 4. Asignaciones de etapas
    $autorUserId = $userMap['autor_ceibo'] ?? 1;
    $editorUserId = $userMap['editor_ceibo'] ?? 1;

    // Asignar autor a etapa de submission
    $assignAuthor = $stageAssignmentDao->newDataObject();
    $assignAuthor->setSubmissionId($subId);
    $assignAuthor->setUserGroupId(14);
    $assignAuthor->setUserId($autorUserId);
    $assignAuthor->setDateAssigned($now);
    $stageAssignmentDao->insertObject($assignAuthor);

    // Asignar editor a la etapa
    $assignEditor = $stageAssignmentDao->newDataObject();
    $assignEditor->setSubmissionId($subId);
    $assignEditor->setUserGroupId(3); // Editor/a
    $assignEditor->setUserId($editorUserId);
    $assignEditor->setDateAssigned($now);
    $stageAssignmentDao->insertObject($assignEditor);

    $reviewRound = null;

    // 5. Ronda de revisión si aplica
    if ($stageId >= 3 || $conRevisor) {
        $reviewRound = $reviewRoundDao->build($subId, WORKFLOW_STAGE_ID_EXTERNAL_REVIEW, 1, $conRevisor ? 5 : 1);

        if ($conRevisor && $reviewRound) {
            $revId = $userMap['revisor_ceibo'] ?? 1;
            $review = $reviewAssignmentDao->newDataObject();
            $review->setSubmissionId($subId);
            $review->setReviewerId($revId);
            $review->setReviewRoundId($reviewRound->getId());
            $review->setStageId(WORKFLOW_STAGE_ID_EXTERNAL_REVIEW);
            $review->setRound(1);
            $review->setReviewMethod(1);
            $review->setDateAssigned($now);
            $review->setDateConfirmed($now);
            $review->setDateCompleted($now);
            $review->setRecommendation(1); // Accept Submission
            $reviewAssignmentDao->insertObject($review);
        }
    }

    // 6. Decisión editorial si aplica
    if ($decision !== null) {
        $editorDecision = [
            'editDecisionId' => null,
            'editorId' => $editorUserId,
            'decision' => $decision,
            'dateDecided' => $now
        ];
        $editDecisionDao->updateEditorDecision($subId, $editorDecision, $stageId, $reviewRound);
    }

    // 7. Si es publicado, agregar galerada PDF simulada
    if ($status == STATUS_PUBLISHED) {
        $galleyDao = DAORegistry::getDAO('ArticleGalleyDAO');
        $galley = $galleyDao->newDataObject();
        $galley->setData('publicationId', $pubId);
        $galley->setData('locale', 'es_ES');
        $galley->setData('label', 'PDF');
        $galley->setData('seq', 1);
        $galley->setData('remoteUrl', 'https://revistas.utm.edu.ec/sample_articulo.pdf');
        $galleyDao->insertObject($galley);
    }

    return $subId;
}

echo "=== Creando artículos de ejemplo ===" . PHP_EOL;

// 1. PUBLICADO
$idPub = crearArticulo(
    "Biodiversidad y conservación del bosque seco tropical en la provincia de Manabí",
    "Este trabajo analiza la flora y fauna representativa de los remanentes de bosque seco tropical en la región central de Manabí, proponiendo estrategias de conservación comunitaria y establecimiento de corredores biológicos.",
    "María",
    "Gómez",
    "maria.gomez@utm.edu.ec",
    STATUS_PUBLISHED,
    5, // WORKFLOW_STAGE_ID_PRODUCTION
    $issueId,
    1, // SUBMISSION_EDITOR_DECISION_ACCEPT
    true,
    $userMap
);
echo "1. Artículo Publicado creado (ID: $idPub)" . PHP_EOL;

// 2. ACEPTADO (En edición de estilo y maquetación)
$idAcep = crearArticulo(
    "Gestión editorial universitaria y políticas de acceso abierto en América Latina",
    "Se revisan las tendencias actuales de indización, interoperabilidad con OAI-PMH y sostenibilidad de las revistas científicas gestionadas con Open Journal Systems en instituciones de educación superior.",
    "Roberto",
    "Alarcón",
    "roberto.alarcon@utm.edu.ec",
    STATUS_QUEUED,
    4, // WORKFLOW_STAGE_ID_EDITING
    null,
    1, // SUBMISSION_EDITOR_DECISION_ACCEPT
    true,
    $userMap
);
echo "2. Artículo Aceptado (En edición) creado (ID: $idAcep)" . PHP_EOL;

// 3. EN REVISIÓN / REVISADO (En evaluación con dictamen completado)
$idRev = crearArticulo(
    "Impacto del cambio climático en los cultivos de maíz y café en la cuenca del río Portoviejo",
    "Evaluación de series temporales de precipitación y temperatura (2010-2025) y su correlación con el rendimiento agronómico en pequeños y medianos productores agrícolas de la provincia de Manabí.",
    "Andrea",
    "Vera",
    "andrea.vera@utm.edu.ec",
    STATUS_QUEUED,
    3, // WORKFLOW_STAGE_ID_EXTERNAL_REVIEW
    null,
    null,
    true, // Dictamen completado por revisor
    $userMap
);
echo "3. Artículo En revisión / Revisado creado (ID: $idRev)" . PHP_EOL;

// 4. RECHAZADO (Declinado en evaluación)
$idRech = crearArticulo(
    "Análisis preliminar de tecnologías blockchain aplicadas a sistemas de bibliotecas escolares",
    "Estudio exploratorio sobre la viabilidad técnica y económica del uso de contratos inteligentes para el préstamo interbibliotecario en centros de educación básica.",
    "Pedro",
    "Moreira",
    "pedro.moreira@utm.edu.ec",
    STATUS_DECLINED,
    1, // WORKFLOW_STAGE_ID_SUBMISSION
    null,
    9, // SUBMISSION_EDITOR_DECISION_INITIAL_DECLINE
    false,
    $userMap
);
echo "4. Artículo Rechazado creado (ID: $idRech)" . PHP_EOL;

// 5. ENVIADO (En espera de revisión editorial inicial)
$idEnv = crearArticulo(
    "Inteligencia artificial aplicada a la revisión por pares: oportunidades y dilemas éticos",
    "Un análisis crítico sobre el rol de los modelos de lenguaje de gran escala en la redacción, síntesis y dictamen de manuscritos científicos, proponiendo directrices éticas para evaluadores y comités editoriales.",
    "Patricia",
    "Solórzano",
    "patricia.solorzano@utm.edu.ec",
    STATUS_QUEUED,
    1, // WORKFLOW_STAGE_ID_SUBMISSION
    null,
    null,
    false,
    $userMap
);
echo "5. Artículo Enviado creado (ID: $idEnv)" . PHP_EOL;

echo "=== Todos los datos iniciales de Revista Ceibo fueron generados exitosamente ===" . PHP_EOL;
