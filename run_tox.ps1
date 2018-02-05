Try
{
    python --version > $Null
}
Catch [System.Management.Automation.CommandNotFoundException]
{
    throw "Python is not installed!"
}

Try
{
    pip --version > $Null
}
Catch [System.Management.Automation.CommandNotFoundException]
{
    throw "Pip seems to be missing!"
}

$isToxInstalled = (pip freeze | Select-String -Pattern "tox") | Out-String
if (!$isToxInstalled -contains "tox")
{
    pip install tox
}

echo Setting up the environment

.\setps1key.ps1
.\setpykey.ps1
.\prep_local.ps1

tox:
