using MediaOnDemand;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System;
using System.Web.UI.WebControls;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for WatchMoviesTest and is intended
    ///to contain all WatchMoviesTest Unit Tests
    ///</summary>
    [TestClass()]
    public class WatchMoviesTest
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
        ///A test for UpdateRecordCount
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void UpdateRecordCountTest()
        {
            WatchMovies_Accessor target = new WatchMovies_Accessor(); // TODO: Initialize to an appropriate value
            target.UpdateRecordCount();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for SetList
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void SetListTest()
        {
            WatchMovies_Accessor target = new WatchMovies_Accessor(); // TODO: Initialize to an appropriate value
            target.SetList();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for Page_Load
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void Page_LoadTest()
        {
            WatchMovies_Accessor target = new WatchMovies_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.Page_Load(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for lnqMovies_Selected
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void lnqMovies_SelectedTest()
        {
            WatchMovies_Accessor target = new WatchMovies_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            LinqDataSourceStatusEventArgs e = null; // TODO: Initialize to an appropriate value
            target.lnqMovies_Selected(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for ddlPageSize_SelectedIndexChanged
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void ddlPageSize_SelectedIndexChangedTest()
        {
            WatchMovies_Accessor target = new WatchMovies_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.ddlPageSize_SelectedIndexChanged(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for ddlGenre_SelectedIndexChanged
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void ddlGenre_SelectedIndexChangedTest()
        {
            WatchMovies_Accessor target = new WatchMovies_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.ddlGenre_SelectedIndexChanged(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for WatchMovies Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void WatchMoviesConstructorTest()
        {
            WatchMovies target = new WatchMovies();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
