# Copyright 2017 UniCredit S.p.A.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Copyright 2017 UniCredit S.p.A.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import unittest, sequtils, nimat/sparse

# In the examples, m is
# [
#   1 0 2 3
#   0 4 0 0
#   5 0 6 7
#   0 8 0 9
# ]

suite "iterators on matrices":
  test "csr matrix iterator":
    let
      m = csr(
        rows = @[0'i32, 3, 4, 7, 9],
        cols = @[0'i32, 2, 3, 1, 0, 2, 3, 1, 3],
        vals = @[1'f32, 2, 3, 4, 5, 6, 7, 8, 9],
        numCols = 4
      )
      values = toSeq(m.items)
    check values == @[1'f32, 0, 2, 3, 0, 4, 0, 0, 5, 0, 6, 7, 0, 8, 0, 9]
  test "csc matrix iterator":
    let
      m = csc(
        rows = @[0'i32, 2, 1, 3, 0, 2, 0, 2, 3],
        cols = @[0'i32, 2, 4, 6, 9],
        vals = @[1'f32, 5, 4, 8, 2, 6, 3, 7, 9],
        numRows = 4
      )
      values = toSeq(m.items)
    check values == @[1'f32, 0, 5, 0, 0, 4, 0, 8, 2, 0, 6, 0, 3, 0, 7, 9]
  test "coo matrix iterator":
    let
      m = coo(
        rows = @[0'i32, 0, 0, 1, 2, 2, 2, 3, 3],
        cols = @[0'i32, 2, 3, 1, 0, 2, 3, 1, 3],
        vals = @[1'f32, 2, 3, 4, 5, 6, 7, 8, 9],
        numRows = 4,
        numCols = 4
      )
      values = toSeq(m.items)
    check values == @[1'f32, 0, 2, 3, 0, 4, 0, 0, 5, 0, 6, 7, 0, 8, 0, 9]