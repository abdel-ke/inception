<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
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
define( 'DB_USER', 'abdel-ke' );

/** MySQL database password */
define( 'DB_PASSWORD', '1337@sh' );

/** MySQL hostname */
define( 'DB_HOST', 'abdelke-1337.local' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'H-a25wlnt3FV^P[8xf{:F8@j[UpZZ))8g7E(*1<HjxgSjTsNvPWt!hBU!eR2A n+' );
define( 'SECURE_AUTH_KEY',  'VY7(]N!kP[p~_UuG+L5wr1[(}&v}kW]^j-];Dv.R[T@=W%wkBZ9<&k16Y{J9`(sJ' );
define( 'LOGGED_IN_KEY',    '*;ki=Rbc9AM#e~lsT!;VXj(0&ZZdzmox#e:Uv]c*8P^-Q9hIPtgIXJZg5+:-/*NT' );
define( 'NONCE_KEY',        'F/BH$yp[Rv{>PdX`vsnc/2l#,V2}>3zJ r2,0c!: !!FjHbYX>(<Ee]q3&T5!(;C' );
define( 'AUTH_SALT',        '-I#B6REk[?[A.HQLhY>XQP~qY.|9QqH6$9uHeBL-xeNIIS>$47b[fXHWp/e{g$j=' );
define( 'SECURE_AUTH_SALT', 'ff9_eD>s*7daMOtF-B<WYgS3.Fe_F<mdh4/=#GV]z<u-vMB~_n-h![+XhGzI?I{R' );
define( 'LOGGED_IN_SALT',   'H%z*|&by6}.rWy7rnr6s9*L_UbLQLu3bWIS`WCnLPMSH2kwkX8Fim338LRogAL=7' );
define( 'NONCE_SALT',       'S}1BNXq&-byQ`1X-}iAn{9V6)c4R X)q1!%Y1 .Fc 0Y<go?]UxXD-z4 xB=>b?_' );

/**#@-*/

/**
 * WordPress database table prefix.
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

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
