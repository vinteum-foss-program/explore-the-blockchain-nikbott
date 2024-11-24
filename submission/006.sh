# Which tx in block 257,343 spends the coinbase output of block 256,128?

block1_height=256128
block2_height=257343

block1_hash=$(bitcoin-cli getblockhash "$block1_height")
block2_hash=$(bitcoin-cli getblockhash "$block2_height")

block1=$(bitcoin-cli getblock "$block1_hash")
block2=$(bitcoin-cli getblock "$block2_hash" 2)

coinbase_txid=$(echo "$block1" | jq -r '.tx[0]')

# no need for details from the coinbase tx since it's a single output
echo "$block2" | jq -r --arg txid "$coinbase_txid" '.tx[] | select(.vin[]?.txid == $txid) | .txid'
