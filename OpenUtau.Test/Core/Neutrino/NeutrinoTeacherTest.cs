using OpenUtau.Core.Ustx;
using Xunit;

namespace OpenUtau.Core.Neutrino {
    /// <summary>歌い方を選んだら direct を on にするかの判定。</summary>
    public class NeutrinoTeacherTest {
        static UExpressionDescriptor Styles() =>
            new UExpressionDescriptor(NeutrinoTeacher.NAME, NeutrinoTeacher.ABBR, true, new[] { "", "NEUTRINO_ZUNDAMON", "NEUTRINO_ZUNKO" });

        [Fact]
        public void PickingAStyleTurnsDirectOn() {
            Assert.True(NeutrinoTeacher.TurnsDirectOn(NeutrinoTeacher.ABBR, 1, Styles()));
            Assert.True(NeutrinoTeacher.TurnsDirectOn(NeutrinoTeacher.ABBR, 2, Styles()));
        }

        [Fact]
        public void ClearingTheStyleLeavesDirectAlone() {
            Assert.False(NeutrinoTeacher.TurnsDirectOn(NeutrinoTeacher.ABBR, 0, Styles()));
            Assert.False(NeutrinoTeacher.TurnsDirectOn(NeutrinoTeacher.ABBR, null, Styles()));
        }

        [Fact]
        public void OtherExpressionsAndBadIndexesDoNothing() {
            Assert.False(NeutrinoTeacher.TurnsDirectOn("pvo", 1, Styles()));
            Assert.False(NeutrinoTeacher.TurnsDirectOn(NeutrinoTeacher.ABBR, 9, Styles()));
            Assert.False(NeutrinoTeacher.TurnsDirectOn(NeutrinoTeacher.ABBR, 1, null));
        }
    }
}
