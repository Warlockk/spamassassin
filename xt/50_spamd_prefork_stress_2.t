
#!/usr/bin/perl
  (-d "../t") and chdir "..";
  system( "$^X", "-T", "t/spamd_prefork_stress_2.t",
        "--override", "run_spamd_prefork_stress_test", "1", @ARGV);
  ($? >> 8 == 0) or die "exec failed";
  

