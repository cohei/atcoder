import           Test.Hspec                      (describe, hspec)

import qualified Spec                            (spec)

import qualified AtCoderBeginnerContest024       (spec)
import qualified AtCoderBeginnerContest030       (spec)
import qualified AtCoderBeginnerContest104       (spec)
import qualified AtCoderBeginnerContest105       (spec)
import qualified AtCoderBeginnerContest110       (spec)
import qualified AtCoderBeginnerContest112       (spec)
import qualified AtCoderBeginnerContest113       (spec)
import qualified AtCoderBeginnerContest117       (spec)
import qualified AtCoderBeginnerContest118       (spec)
import qualified AtCoderBeginnerContest119       (spec)
import qualified AtCoderGrandContest026          (spec)
import qualified AtCoderGrandContest028          (spec)
import qualified AtCoderRegularContest028        (spec)
import qualified AtCoderRegularContest045        (spec)
import qualified DwangoProgrammingContestV       (spec)
import qualified Tenka1ProgrammerBeginnerContest (spec)

main :: IO ()
main = hspec $ do
  Spec.spec
  describe "AtCoderBeginnerContest024" AtCoderBeginnerContest024.spec
  describe "AtCoderBeginnerContest030" AtCoderBeginnerContest030.spec
  describe "AtCoderBeginnerContest104" AtCoderBeginnerContest104.spec
  describe "AtCoderBeginnerContest105" AtCoderBeginnerContest105.spec
  describe "AtCoderBeginnerContest110" AtCoderBeginnerContest110.spec
  describe "AtCoderBeginnerContest112" AtCoderBeginnerContest112.spec
  describe "AtCoderBeginnerContest113" AtCoderBeginnerContest113.spec
  describe "AtCoderBeginnerContest117" AtCoderBeginnerContest117.spec
  describe "AtCoderBeginnerContest118" AtCoderBeginnerContest118.spec
  describe "AtCoderBeginnerContest119" AtCoderBeginnerContest119.spec
  describe "AtCoderGrandContest026" AtCoderGrandContest026.spec
  describe "AtCoderGrandContest028" AtCoderGrandContest028.spec
  describe "AtCoderRegularContest028" AtCoderRegularContest028.spec
  describe "AtCoderRegularContest045" AtCoderRegularContest045.spec
  describe "DwangoProgrammingContestV" DwangoProgrammingContestV.spec
  describe "Tenka1ProgrammerBeginnerContest" Tenka1ProgrammerBeginnerContest.spec
