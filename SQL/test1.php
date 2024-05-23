<?php

$debut=hrtime(true);
$t3=0;
$t4=0;

$db = new PDO('mysql:host=localhost;dbname=demo', 'admin', 'Afpa1234');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$db->exec("START TRANSACTION;");
for ($i=0; $i < 1000000; $i++) { 

   
    $nom = bin2hex(openssl_random_pseudo_bytes(50));
    $prenom = bin2hex(openssl_random_pseudo_bytes(50));
    $ville = bin2hex(openssl_random_pseudo_bytes(50));
    
    try {
        // Préparer et exécuter la requête d'insertion
        $requete = $db->prepare("INSERT INTO client (nom, prenom, ville) VALUES (?, ?, ?);");
        $requete->execute([$nom, $prenom, $ville]);
    
        // Afficher la chaîne aléatoire générée avec les séquences d'échappement correctement échappées
    } catch (PDOException $e) {
        // Gérer les erreurs de la base de données
        echo "Erreur : " . $e->getMessage();
    }
    if ($i % 10000 == 0){
        $p=($i*100)/1000000;
       
            echo $p . "%\n";
            $mid = hrtime(true);
            $t3 = (($mid-$t4)/1000000000);
            $t4=$mid;
            echo "interval {$t3}\n";
    }
}
$db->exec("COMMIT;");


$fin = hrtime(true);
$t1 = ($fin-$debut)/1000000000;

echo "Insertion {$t1}\n";

