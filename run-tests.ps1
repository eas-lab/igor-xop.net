$igor='"C:\Program Files (x86)\WaveMetrics\Igor Pro Folder\Igor.exe"'
$curdir=pwd
$test_file=Join-Path $PSScriptRoot "xop-tests.ipf"
$double_slashed=$test_file.Replace("\","\\")
$ar='/i /x "Execute/P "LOADFILE ' + $double_slashed + '"; Execute/P "COMPILEPROCEDURES "; Execute/P "run_all_tests()""'

$tempscript = Join-Path $PSScriptRoot "local-test-runner.cmd"
"$igor $ar" | Out-File $tempscript -Encoding ASCII
cmd /c call $tempscript
rm $tempscript
