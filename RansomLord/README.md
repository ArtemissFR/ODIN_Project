RansomLord is a proof-of-concept Anti-Ransomware exploitation tool that generates PE files, used to exploit vulnerable ransomware pre-encryption.

Lang: C
SHA256 : 647494bda466e645768d6f7d1cd051097aee319f88018d1a80547d8d538c98db

This version now intercepts and terminates malware tested from 49 different threat groups.
Adding: StopCrypt, RisePro, RuRansom, MoneyMessage, CryptoFortress and Onyx

Feature update:
Windows event IOC log now includes the SHA256 hash plus full path of the intercepted malware
Added -r flag to output a Sigma rule for detecting RansomLord activity using Windows event log.

*** DOWNLOAD "RansomLord_v3.1.exe" EXE file and NOT the "Source code(zip)" .ZIP archive as that contains older versions

Lamer Security engines may incorrectly flag RansomLord DLLs as malicious.
They are NOT! they export Win32 API function stubs, provide functionality
to generate Windows IOC event logs and eventually call exit()

[+] Generated exploit DLL MD5 file hashes:
[+] x32: 37b9ebad522e0744aa8daa0bf5b2a58b
[+] x64: 7807454015bb44161ccf593e2fe5334b

References:
https://web.archive.org/web/20220601204439/https://www.bleepingcomputer.com/news/security/conti-revil-lockbit-ransomware-bugs-exploited-to-block-encryption/
https://web.archive.org/web/20220504180432/https://www.securityweek.com/vulnerabilities-allow-hijacking-most-ransomware-prevent-file-encryption/
