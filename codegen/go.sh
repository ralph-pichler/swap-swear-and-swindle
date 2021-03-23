#!/usr/bin/env sh
yarn compile

SIMPLESWAP_ABI="$(cat artifacts/contracts/ERC20SimpleSwap.sol/ERC20SimpleSwap.json | jq .abi)"
SIMPLESWAP_FACTORY_ABI="$(cat artifacts/contracts/SimpleSwapFactory.sol/SimpleSwapFactory.json | jq .abi)"
SIMPLESWAP_FACTORY_BYTECODE="$(cat artifacts/contracts/SimpleSwapFactory.sol/SimpleSwapFactory.json | jq .bytecode)"

cat <<EOF
// Copyright 2021 The Swarm Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package swapabi

const ERC20SimpleSwapABI = \`$SIMPLESWAP_ABI\`

const SimpleSwapFactoryABI = \`$SIMPLESWAP_FACTORY_ABI\`

const SimpleSwapFactoryBin = $SIMPLESWAP_FACTORY_BYTECODE
EOF