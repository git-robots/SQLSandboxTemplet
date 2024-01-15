namespace SandBoxMSTestProject;

[TestClass]
public class UnitTest1
{
    /// <summary>
    /// this is a sample test to show how to write a test
    /// it is also a good test to keep to prove that tests are running correctly.
    /// </summary>
    [TestMethod]
    public void SandBoxTest_Test_1()
    {
        // Arrange
        var expected = 1;

        // Act
        var actual = 1;

        // Assert
        Assert.AreEqual(expected, actual);
    }
}