# Only one single output remains unspent from block 123,321. What address was it sent to?

block_height=123321
block_hash=$(bitcoin-cli getblockhash "$block_height")
block=$(bitcoin-cli getblock "$block_hash" 2)

# extracts pairs of txids and vouts
outs=$(echo "$block" | jq -r '.tx[] | .txid as $txid | .vout[] | "\($txid) \(.n)"')

# map and filter to get the utxo address
echo "$outs" | xargs -I {} bash -c 'bitcoin-cli gettxout {} | jq -r ".scriptPubKey.address"'
