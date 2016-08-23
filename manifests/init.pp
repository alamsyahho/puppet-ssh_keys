class ssh_keys {
  include ssh_keys::params
  $_homedir_base = $ssh_keys::params::homedir_locations["${osfamlily}"]
  $homedir_base = $_homedir_base ? {
    undef   => $ssh_keys::params::fallback_homedir_location,
    default => $_homedir_base
  }

  $user_hash = hiera('ssh_keys::user', {})
  create_resources('ssh_keys::user', $user_hash)

  $authorized_key_hash = hiera('ssh_keys::authorized_key', {})
  create_resources('ssh_keys::authorized_key', $authorized_key_hash)
}
