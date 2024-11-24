# How many new outputs were created by block 123,456?

block_height=123456
block_hash=$(bitcoin-cli getblockhash "$block_height")

bitcoin-cli getblock "$block_hash" 2 | jq -r '[.tx[].vout | length] | add'
