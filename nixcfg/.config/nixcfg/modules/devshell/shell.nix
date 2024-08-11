{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = " offsec ";

  # REVIEW :: set of packages for offsec
  buildInputs = with pkgs; [
    # -- base -- #
    # bat # a modern replacement for `cat` with syntax highlighting
    # clang # `c` compiler
    # cmake # build system generator
    # coreutils # provides `gnu`core utilities
    # gcc # `gnu` c compiler

    # -- api client -- #
    # atac # `api` client (postman-like)

    # -- exploitation -- #
    # flawz # `tui` for browsing `cve` security vulnerabilities

    # -- text editors -- #
    # neovim
    # vim

    # -- recon -- #
    # dnsrecon # `dns` reconnaissance tool
    # nmap # network scanner/mapper
    # nikto # web server scanner
    # snmpcheck # snmp scanner
    # sslscan # ssl/tls scanner

    # -- networking -- #
    # doggo # dns-client
    # termshark # `tui` for tshark

    # -- passowrd -- #
    # crunch # wordlist generator
    # hashcat # password ~recovery~/cracker
    # john # passowrd cracking tool
    # ncrack # network authentication cracker

    # -- sniffing -- #
    # mitmproxy # a `tls/ssl`-capable interception `http` proxy
    # proxychains-ng # force `tcp` connection to go through proxy

    # -- web -- #
    # dirbuster # directory and file brute-forcing tool
    # ffuf # fuzzer for discovering hidden directories and files
    # gobuster # directory and file brute-forcing tool
    # sqlmap # `sql` injection tool
    # wfuzz # web application fuzzer
    # whatweb # web technology scanner
    # wpscan # # wordpress vulneraability scanner

    # -- dev -- #
    # ansible # it-automation tool
    # cargo # rust package manager
    # ghc # `haskell` compiler
    # git # version control system
    # go # `go` language compiler
    # jq # cli `json` processor
    # kubectl # kubernetes cli
    # openssl # toolkit for `ssl/tls`
    # python3 # `python` programming language
    # rustc # `rust` compiler
    # stack # `haskell` build tool
    # terraform # infrastructure as code
    # yq # `yaml` processor

    # -- shell -- #
    # bashInteractive # interactive shell
    # fish # friendly interactive shell
    # zsh # `z` shell
  ];

  # shellHook = ''
  # '';
}
