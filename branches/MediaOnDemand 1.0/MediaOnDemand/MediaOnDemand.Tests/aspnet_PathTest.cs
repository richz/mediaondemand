using MediaOnDemand;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System;
using System.Data.Linq;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for aspnet_PathTest and is intended
    ///to contain all aspnet_PathTest Unit Tests
    ///</summary>
    [TestClass()]
    public class aspnet_PathTest
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
            aspnet_Path target = new aspnet_Path(); // TODO: Initialize to an appropriate value
            Guid expected = new Guid(); // TODO: Initialize to an appropriate value
            Guid actual;
            target.PathId = expected;
            actual = target.PathId;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for Path
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void PathTest()
        {
            aspnet_Path target = new aspnet_Path(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.Path = expected;
            actual = target.Path;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for LoweredPath
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void LoweredPathTest()
        {
            aspnet_Path target = new aspnet_Path(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.LoweredPath = expected;
            actual = target.LoweredPath;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_PersonalizationPerUsers
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_PersonalizationPerUsersTest()
        {
            aspnet_Path target = new aspnet_Path(); // TODO: Initialize to an appropriate value
            EntitySet<aspnet_PersonalizationPerUser> expected = null; // TODO: Initialize to an appropriate value
            EntitySet<aspnet_PersonalizationPerUser> actual;
            target.aspnet_PersonalizationPerUsers = expected;
            actual = target.aspnet_PersonalizationPerUsers;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_PersonalizationAllUser
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_PersonalizationAllUserTest()
        {
            aspnet_Path target = new aspnet_Path(); // TODO: Initialize to an appropriate value
            aspnet_PersonalizationAllUser expected = null; // TODO: Initialize to an appropriate value
            aspnet_PersonalizationAllUser actual;
            target.aspnet_PersonalizationAllUser = expected;
            actual = target.aspnet_PersonalizationAllUser;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_Application
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_ApplicationTest()
        {
            aspnet_Path target = new aspnet_Path(); // TODO: Initialize to an appropriate value
            aspnet_Application expected = null; // TODO: Initialize to an appropriate value
            aspnet_Application actual;
            target.aspnet_Application = expected;
            actual = target.aspnet_Application;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for ApplicationId
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void ApplicationIdTest()
        {
            aspnet_Path target = new aspnet_Path(); // TODO: Initialize to an appropriate value
            Guid expected = new Guid(); // TODO: Initialize to an appropriate value
            Guid actual;
            target.ApplicationId = expected;
            actual = target.ApplicationId;
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
            aspnet_Path_Accessor target = new aspnet_Path_Accessor(); // TODO: Initialize to an appropriate value
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
            aspnet_Path_Accessor target = new aspnet_Path_Accessor(); // TODO: Initialize to an appropriate value
            string propertyName = string.Empty; // TODO: Initialize to an appropriate value
            target.SendPropertyChanged(propertyName);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for detach_aspnet_PersonalizationPerUsers
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void detach_aspnet_PersonalizationPerUsersTest()
        {
            aspnet_Path_Accessor target = new aspnet_Path_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_PersonalizationPerUser entity = null; // TODO: Initialize to an appropriate value
            target.detach_aspnet_PersonalizationPerUsers(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for attach_aspnet_PersonalizationPerUsers
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void attach_aspnet_PersonalizationPerUsersTest()
        {
            aspnet_Path_Accessor target = new aspnet_Path_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_PersonalizationPerUser entity = null; // TODO: Initialize to an appropriate value
            target.attach_aspnet_PersonalizationPerUsers(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for aspnet_Path Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_PathConstructorTest()
        {
            aspnet_Path target = new aspnet_Path();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
