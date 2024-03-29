<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur
 * {@link http://codex.wordpress.org/fr:Modifier_wp-config.php Modifier
 * wp-config.php}. C’est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'wp_user' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'erty' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', '10.0.0.8:3306' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Type de collation de la base de données.
  * N’y touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', '');

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Lr@TPdEQq>{$m`h0cnH&]c{&V*Fut&RT*$S?/SdVpPDejj!u3UZz?RMY5b0}<b2@' );
define( 'SECURE_AUTH_KEY',  'm2{Re*rf1CIgHBRc}oZ}s.b#{_&]5U,{Txe^jd[ZATG>oP]!&S[M*YgDyyX6N{cB' );
define( 'LOGGED_IN_KEY',    '[W-;iY 0,;yzT6On;l,q:T&FicW@<~pN]Wzh rk?s1js^ksP88O? |(85*UyYj}1' );
define( 'NONCE_KEY',        'dbeTj^SkxvY4_.h9Y!hN +*b5SBC,}L;}2/nLe.!!G5n%^o[nEyvibKk2i(v`rF8' );
define( 'AUTH_SALT',        '=Etbf84cam$2Z!zeP-e4+``&4<2} |<qg&|p;R4gC+P~iySz@=<g#.gZpTF.6SiA' );
define( 'SECURE_AUTH_SALT', 'W?u!V6}~m]**9&E9EH#iJ,K^wr[^aJShCz|iKomN1FUn0T)RyZ$TeK6RGS.|N7w^' );
define( 'LOGGED_IN_SALT',   ' v]/aQ1475+eh,nsrqiPXw9 (9)B4mC>K`8*>HSN,,J;W(+.-7|dBZ!p@XI6c=96' );
define( 'NONCE_SALT',       'U]_-3*8U&0kU ;Exm|ZJ=H6Mm &?/ t6qb-$N]-?wqevqI2SU7^S+ANg>a&X`v!B' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');

