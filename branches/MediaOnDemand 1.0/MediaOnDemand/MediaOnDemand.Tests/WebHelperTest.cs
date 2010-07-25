using MediaOnDemandLibrary;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.UI;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for WebHelperTest and is intended
    ///to contain all WebHelperTest Unit Tests
    ///</summary>
    [TestClass()]
    public class WebHelperTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for GetControlById
        ///</summary>
        [TestMethod()]
        public void GetControlByIdTest()
        {
            Control parent = new Control(); // TODO: Initialize to an appropriate value
            Control child = new Control();
            string childId ="targetchild"; // TODO: Initialize to an appropriate value
            child.ID = childId;
            parent.Controls.Add(child);
            Control expected = parent.FindControl(child.ID); // TODO: Initialize to an appropriate value
            Control actual;
            actual = WebHelper.GetControlById(parent, childId);
            Assert.AreEqual(expected, actual);            
        }
    }
}
