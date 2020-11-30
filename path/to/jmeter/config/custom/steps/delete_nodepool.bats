#!/usr/bin/env bash
# if you execute these tests on Windows git bash, make sure you install jq via choco: chocolatey install jq

load $HOME/test/test_helper/bats-assert/load.bash
load $HOME/test/test_helper/bats-support/load.bash

function setup(){
  source delete_nodepool.sh
  az(){
    :
  }
  export -f az
}
function teardown(){
  unset az
}

@test "UT:delete_nodepool" {
  :
}
