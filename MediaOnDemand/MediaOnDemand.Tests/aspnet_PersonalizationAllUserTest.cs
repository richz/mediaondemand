using MediaOnDemand;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System;
using System.Data.Linq;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for aspnet_PersonalizationAllUserTest and is intended
    ///to contain all aspnet_PersonalizationAllUserTest Unit Tests
    ///</summary>
    [TestClass()]
    public class aspnet_PersonalizationAllUserTest
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
        ///A test for PathId
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void PathIdTest()
        {
            aspnet_PersonalizationAllUser target = new aspnet_PersonalizationAllUser(); // TODO: Initialize to an appropriate value
            Guid expected = new Guid(); // TODO: Initialize to an appropriate value
            Guid actual;
            target.PathId = expected;
            actual = target.PathId;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for PageSettings
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void PageSettingsTest()
        {
            aspnet_PersonalizationAllUser target = new aspnet_PersonalizationAllUser(); // TODO: Initialize to an appropriate value
            Binary expected = null; // TODO: Initialize to an appropriate value
            Binary actual;
            target.PageSettings = expected;
            actual = target.PageSettings;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for LastUpdatedDate
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void LastUpdatedDateTest()
        {
            aspnet_PersonalizationAllUser target = new aspnet_PersonalizationAllUser(); // TODO: Initialize to an appropriate value
            DateTime expected = new DateTime(); // TODO: Initialize to an appropriate value
            DateTime actual;
            target.LastUpdatedDate = expected;
            actual = target.LastUpdatedDate;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_Path
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_PathTest()
        {
            aspnet_PersonalizationAllUser target = new aspnet_PersonalizationAllUser(); // TODO: Initialize to an appropriate value
            aspnet_Path expected = null; // TODO: Initialize to an appropriate value
            aspnet_Path actual;
            target.aspnet_Path = expected;
            actual = target.aspnet_Path;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for SendPropertyChanging
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void SendPropertyChangingTest()
        {
            aspnet_PersonalizationAllUser_Accessor target = new aspnet_PersonalizationAllUser_Accessor(); // TODO: Initialize to an appropriate value
            target.SendPropertyChanging();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for SendPropertyChanged
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void SendPropertyChangedTest()
        {
            aspnet_PersonalizationAllUser_Accessor target = new aspnet_PersonalizationAllUser_Accessor(); // TODO: Initialize to an appropriate value
            string propertyName = string.Empty; // TODO: Initialize to an appropriate value
            target.SendPropertyChanged(propertyName);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for aspnet_PersonalizationAllUser Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_PersonalizationAllUserConstructorTest()
        {
            aspnet_PersonalizationAllUser target = new aspnet_PersonalizationAllUser();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
