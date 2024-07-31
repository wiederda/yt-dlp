$strDate = Get-Date -format "yyyy-MM-dd_HHmmss"

if (Test-Path /home/output/audio.txt) {
    New-Item -Path /home/output/Audio/$strDate -ItemType Directory
    Set-Location /home/output/Audio/$strDate

    $audioListe = Get-Content /home/output/audio.txt | Where-Object { $_ -match '\S' }
    $tempDatei = "/home/output/audio_temp.txt"
    $logDatei = "/home/output/audio.log"

    foreach ($line in $audioListe) {
        # Log-Datei aktualisieren
        Add-Content $logDatei $line

        # Video herunterladen mit yt-dlp
        yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" $line

        # Lösche die erfolgreich heruntergeladene Zeile aus video.txt
        $audioListe = $audioListe | Where-Object { $_ -ne $line }
        $audioListe | Set-Content /home/output/audio.txt
    }

    # Optional: Leere die Video-Liste und entferne die Datei
    $null | Set-Content /home/output/audio.txt
    Remove-Item /home/output/audio.txt -Force
}