$igor='"C:\Program Files (x86)\WaveMetrics\Igor Pro Folder\Igor.exe"'
$curdir=pwd
$test_file=join-path $curdir "xop-tests.ipf"
$double_slashed=$test_file.Replace("\","\\")
$ar='/i /x "Execute/P "LOADFILE ' + $double_slashed + '"; Execute/P "COMPILEPROCEDURES "; Execute/P "run_all_tests()""'
"$igor $ar" | Out-File run-tests.cmd -Encoding ASCII
cmd /c call run-tests.cmd
rm run-tests.cmd
