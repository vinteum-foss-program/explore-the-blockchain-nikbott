# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

txid=37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517

tx=$(bitcoin-cli getrawtransaction "$txid" 1)

# json array with every input witness pubkey
pubkeys=$(echo "$tx" | jq -r '[.vin[].txinwitness[1]]')

# we only need the address
bitcoin-cli createmultisig 1 "$pubkeys" | jq -r '.address'
