class dashboard::production {

  notify {"Setting up the production environment":}

  user { "www":
    comment => "Dashboad User",
    home => "/home/www",
    ensure => present,
    shell => "/bin/bash",
  }

}
