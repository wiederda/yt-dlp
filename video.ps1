$strDate = Get-Date -format "yyyy-MM-dd_HHmmss"

if (Test-Path /home/output/video.txt) {
    New-Item -Path /home/output/Video/$strDate -ItemType Directory
    Set-Location /home/output/Video/$strDate

    $videoListe = Get-Content /home/output/video.txt | Where-Object { $_ -match '\S' }
    $tempDatei = "/home/output/video_temp.txt"
    $logDatei = "/home/output/video.log"

    foreach ($line in $videoListe) {
        # Log-Datei aktualisieren
        Add-Content $logDatei $line

        # Video herunterladen mit yt-dlp
        yt-dlp --embed-thumbnail --embed-subs --no-playlist --merge-output-format mp4 -o "%(title)s.%(ext)s" $line

        # Lösche die erfolgreich heruntergeladene Zeile aus video.txt
        $videoListe = $videoListe | Where-Object { $_ -ne $line }
        $videoListe | Set-Content /home/output/video.txt
    }

    # Optional: Leere die Video-Liste und entferne die Datei
    $null | Set-Content /home/output/video.txt
    Remove-Item /home/output/video.txt -Force
}

