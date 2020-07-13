require_relative './test_init'

TestBench::Run.(
  %r{/_|sketch|(_init\.rb|_tests\.rb)\z}
) or exit 1
