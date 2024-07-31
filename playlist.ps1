$strDate = Get-Date -format "yyyy-MM-dd_HHmmss"

if (Test-Path /home/output/playlist.txt) {
    New-Item -Path /home/output/Playlist/$strDate -ItemType Directory
    Set-Location /home/output/Playlist/$strDate

    $playlist = Get-Content /home/output/playlist.txt | Where-Object { $_ -match '\S' }
    $tempDatei = "/home/output/playlist_temp.txt"
    $logDatei = "/home/output/playlist.log"

    foreach ($line in $playlist) {
        # Log-Datei aktualisieren
        Add-Content $logDatei $line

        # Video herunterladen mit yt-dlp
        yt-dlp --embed-thumbnail --embed-subs --merge-output-format mp4 -o "%(title)s.%(ext)s" $line

        # Lösche die erfolgreich heruntergeladene Zeile aus playlist.txt
        $playlist = $playlist | Where-Object { $_ -ne $line }
        $playlist | Set-Content /home/output/playlist.txt
    }

    # Optional: Leere die Video-Liste und entferne die Datei
    $null | Set-Content /home/output/playlist.txt
    Remove-Item /home/output/playlist.txt -Force
}