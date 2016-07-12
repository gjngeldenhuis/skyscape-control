# Assigning trusted certificate extensions to puppet variables

# The agent_pe_version variable needs to be set here otherwise it
# gets set after it is used and results in a broken system.
$agent_pe_version = pe_build_version()
$somerandomvalue = '0.1'
