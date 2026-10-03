<?php

require('./tools/bootstrap.inc.php');
use Illuminate\Database\Capsule\Manager as Capsule;

function generateArticlePdf($title, $author, $issueInfo) {
    // Sanitize ASCII for Helvetica Type1
    $titleAscii = iconv("UTF-8", "ASCII//TRANSLIT", $title);
    $authorAscii = iconv("UTF-8", "ASCII//TRANSLIT", $author);
    $issueAscii = iconv("UTF-8", "ASCII//TRANSLIT", $issueInfo);
    
    // Line wrapping for title
    $titleLines = explode("\n", wordwrap($titleAscii, 55, "\n"));
    
    $stream = "BT\n";
    $stream .= "/F1 10 Tf 50 740 Td (REVISTA CEIBO - UNIVERSIDAD TECNICA DE MANABI) Tj ET\n";
    $stream .= "BT /F1 9 Tf 50 725 Td (" . addcslashes($issueAscii, "()\\") . " | e-ISSN: 2953-6286) Tj ET\n";
    $stream .= "0.5 w 50 715 m 550 715 l S\n";
    
    // Title
    $y = 680;
    foreach ($titleLines as $line) {
        $stream .= "BT /F2 14 Tf 50 $y Td (" . addcslashes($line, "()\\") . ") Tj ET\n";
        $y -= 20;
    }
    
    $y -= 10;
    $stream .= "BT /F1 11 Tf 50 $y Td (Autor/a: " . addcslashes($authorAscii, "()\\") . ") Tj ET\n";
    $y -= 16;
    $stream .= "BT /F1 10 Tf 50 $y Td (Afiliacion: Universidad Tecnica de Manabi, Portoviejo, Ecuador) Tj ET\n";
    
    $y -= 30;
    $stream .= "0.2 w 50 " . ($y + 15) . " m 550 " . ($y + 15) . " l S\n";
    $stream .= "BT /F2 11 Tf 50 $y Td (RESUMEN) Tj ET\n";
    $y -= 16;
    $stream .= "BT /F1 10 Tf 50 $y Td (Este articulo cientifico constituye una investigacion original arbitrada bajo la) Tj ET\n";
    $y -= 14;
    $stream .= "BT /F1 10 Tf 50 $y Td (modalidad de doble ciego en Revista Ceibo. Se examinan con rigor metodologico los) Tj ET\n";
    $y -= 14;
    $stream .= "BT /F1 10 Tf 50 $y Td (hallazgos empiricos, la discusion teorica y las conclusiones aplicadas al entorno regional.) Tj ET\n";
    
    $y -= 25;
    $stream .= "BT /F2 10 Tf 50 $y Td (Palabras clave: ) Tj /F1 10 Tf (investigacion cientifica, desarrollo regional, metodologia, educacion superior.) Tj ET\n";
    
    $y -= 35;
    $stream .= "0.2 w 50 " . ($y + 15) . " m 550 " . ($y + 15) . " l S\n";
    $stream .= "BT /F2 11 Tf 50 $y Td (1. INTRODUCCION Y METODOLOGIA) Tj ET\n";
    $y -= 16;
    $stream .= "BT /F1 10 Tf 50 $y Td (El presente estudio responde a las directrices de publicacion de acceso abierto diamante) Tj ET\n";
    $y -= 14;
    $stream .= "BT /F1 10 Tf 50 $y Td (de la Universidad Tecnica de Manabi. La recoleccion de informacion y el tratamiento) Tj ET\n";
    $y -= 14;
    $stream .= "BT /F1 10 Tf 50 $y Td (estadistico de los datos aseguran la reproducibilidad de los resultados obtenidos.) Tj ET\n";
    
    $y -= 50;
    $stream .= "0.5 w 50 60 m 550 60 l S\n";
    $stream .= "BT /F1 8 Tf 50 45 Td (Revista Ceibo | Licencia Creative Commons Atribucion-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)) Tj ET\n";
    
    $len = strlen($stream);
    
    $pdf = "%PDF-1.4\n"
         . "1 0 obj << /Type /Catalog /Pages 2 0 R >> endobj\n"
         . "2 0 obj << /Type /Pages /Kids [3 0 R] /Count 1 >> endobj\n"
         . "3 0 obj << /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Contents 4 0 R /Resources << /Font << /F1 5 0 R /F2 6 0 R >> >> >> endobj\n"
         . "4 0 obj << /Length " . $len . " >>\nstream\n" . $stream . "\nendstream\nendobj\n"
         . "5 0 obj << /Type /Font /Subtype /Type1 /BaseFont /Helvetica >> endobj\n"
         . "6 0 obj << /Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold >> endobj\n"
         . "xref\n0 7\n0000000000 65535 f \n"
         . "trailer << /Size 7 /Root 1 0 R >>\nstartxref\n0\n%%EOF\n";
    return $pdf;
}

$articles = [
    8 => ["title" => "Desarrollo territorial y cadenas de valor agroalimentarias en la costa ecuatoriana", "author" => "Carmen Holguín", "issue" => "Vol. 1 Núm. 1 (2025)", "galleyId" => 2],
    9 => ["title" => "Patrimonio cultural inmaterial y memoria oral en comunidades rurales de Manabí", "author" => "Gonzalo Mendoza", "issue" => "Vol. 1 Núm. 1 (2025)", "galleyId" => 3],
    10 => ["title" => "Gestión de recursos hídricos superficiales y resiliencia ante eventos hidroclimáticos extremos", "author" => "Xavier Bravo", "issue" => "Vol. 1 Núm. 1 (2025)", "galleyId" => 4],
    11 => ["title" => "Estrategias de gamificación aplicadas a la enseñanza de matemáticas en el bachillerato", "author" => "Diana Villacreses", "issue" => "Vol. 1 Núm. 2 (2025)", "galleyId" => 5],
    12 => ["title" => "Competencias digitales docentes y entornos virtuales en la educación superior pública", "author" => "Jorge Lucas", "issue" => "Vol. 1 Núm. 2 (2025)", "galleyId" => 6],
    13 => ["title" => "Ecosistemas de aprendizaje abierto y plataformas colaborativas en la formación médica", "author" => "Teresa Anchundia", "issue" => "Vol. 1 Núm. 2 (2025)", "galleyId" => 7],
    14 => ["title" => "Biodiversidad y conservación del bosque seco tropical en la provincia de Manabí", "author" => "María Gómez", "issue" => "Vol. 2 Núm. 1 (2026)", "galleyId" => 8],
    15 => ["title" => "Microplásticos en ecosistemas estuarinos y su impacto en comunidades de macroinvertebrados", "author" => "Nelson Pinargote", "issue" => "Vol. 2 Núm. 1 (2026)", "galleyId" => 9],
    16 => ["title" => "Economía circular y aprovechamiento de biomasa residual en la agroindustria cacaotera", "author" => "Fabiola Delgado", "issue" => "Vol. 2 Núm. 1 (2026)", "galleyId" => 10],
];

foreach ($articles as $subId => $data) {
    $dir = "/var/www/files/contexts/1/submissions/$subId";
    if (!file_exists($dir)) {
        mkdir($dir, 0777, true);
    }
    $filename = "proof-article-$subId.pdf";
    $relPath = "contexts/1/submissions/$subId/$filename";
    $fullPath = "$dir/$filename";
    
    $pdf = generateArticlePdf($data["title"], $data["author"], $data["issue"]);
    file_put_contents($fullPath, $pdf);
    
    // Check if files entry exists or create new
    $existingFile = Capsule::table("files")->where("path", $relPath)->first();
    if ($existingFile) {
        $fileId = $existingFile->file_id;
    } else {
        $fileId = Capsule::table("files")->insertGetId([
            "path" => $relPath,
            "mimetype" => "application/pdf"
        ]);
    }
    
    // Check submission_files
    $existingSubFile = Capsule::table("submission_files")
        ->where("submission_id", $subId)
        ->where("file_stage", 10)
        ->first();
    
    $now = Core::getCurrentDate();
    $galleyId = $data["galleyId"];
    if ($existingSubFile) {
        $subFileId = $existingSubFile->submission_file_id;
        Capsule::table("submission_files")->where("submission_file_id", $subFileId)->update([
            "file_id" => $fileId,
            "updated_at" => $now,
            "assoc_type" => 521,
            "assoc_id" => $galleyId
        ]);
    } else {
        $subFileId = Capsule::table("submission_files")->insertGetId([
            "submission_id" => $subId,
            "file_id" => $fileId,
            "genre_id" => 1,
            "file_stage" => 10,
            "viewable" => 1,
            "created_at" => $now,
            "updated_at" => $now,
            "uploader_user_id" => 2,
            "assoc_type" => 521,
            "assoc_id" => $galleyId
        ]);
    }
    
    // Setting name in submission_file_settings
    Capsule::table("submission_file_settings")->updateOrInsert(
        ["submission_file_id" => $subFileId, "locale" => "es_ES", "setting_name" => "name"],
        ["setting_value" => "Articulo_" . $subId . ".pdf", "setting_type" => "string"]
    );
    
    // Update publication_galleys
    Capsule::table("publication_galleys")
        ->where("galley_id", $galleyId)
        ->update([
            "submission_file_id" => $subFileId,
            "remote_url" => null,
            "is_approved" => 1
        ]);
        
    echo "Articulo $subId: Galley $galleyId vinculada con exito (File ID: $fileId, SubFile ID: $subFileId)\n";
}
