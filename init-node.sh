#!/bin/bash
set -exm

export RPC_PORT=18332
export PORT=18444
export NODE_NAME="node"

mkdir $NODE_NAME

dogecoind -dns=0 -datadir=$NODE_NAME -rpcport=$RPC_PORT -port=$PORT -regtest=1 -printtoconsole -rpcbind=* -rpcallowip=0.0.0.0/0 -rpcpassword=password -rpcuser=user -txindex=1 &

sleep 10

ADDRESS=$(dogecoin-cli -rpcport=$RPC_PORT -regtest=1 -rpcpassword=password -rpcuser=user getnewaddress)

dogecoin-cli -rpcport=$RPC_PORT -regtest=1 -rpcpassword=password -rpcuser=user generatetoaddress 432 "$ADDRESS"

fg
