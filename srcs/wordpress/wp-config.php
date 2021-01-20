<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wpuser' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'goKk$clVL[p-nZX#sWL  P-P-/U }-Tj`GR$HYuqt4$6DNQsd?swB[B@3JW:yI{T');
define('SECURE_AUTH_KEY',  '=_Z|+zv0#;QF`T~O4TxR43fBV<OIrgq+&pS|TZ{e`<]JW4cu51xhZ8R}[p?9^$T*');
define('LOGGED_IN_KEY',    '6.ihRCTu.%C`qw;bKF9+SRrHu-SQgzt@=PtuX6*FrKJlv+OQ6%w)KDpUj8Jt,-j)');
define('NONCE_KEY',        'fox>QvIB@AG#sk6N2e}^OE3/a4pf2MELM}04D]O0ynUP|LsMig)`bZ2mGFTM=F]*');
define('AUTH_SALT',        '(uOWIMJ#DeS/3wB1*ZQiojz&76!MI>?STe-`,)C+4;|C7 igeJZ+JP]sT8>e3+{!');
define('SECURE_AUTH_SALT', '_V.uZ[iHF4/^0V+} F>8-L?s2a87N+p)3TO`#McM+5(FjM.6 n5`:5Q4%T%)6@QW');
define('LOGGED_IN_SALT',   'pX,pb-72LKp@?vdzE4q>MKQHKn@M4KBEuH0FOj5xJ?7*9S$-o_8f~t6@-n@34Uro');
define('NONCE_SALT',       '@roY]GYG-g[UET4j<xmqa08ByC.|dXUrpU@oDEM+qghH]{OT gj_.E{JUu%cH$g ');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
