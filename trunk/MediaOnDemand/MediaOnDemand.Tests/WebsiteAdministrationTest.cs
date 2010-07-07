using MediaOnDemand;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System;
using System.Web.UI.WebControls;
using System.IO;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for WebsiteAdministrationTest and is intended
    ///to contain all WebsiteAdministrationTest Unit Tests
    ///</summary>
    [TestClass()]
    public class WebsiteAdministrationTest
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
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            target.UpdateRecordCount();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for StoredMediaRecordExistsByTitle
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void StoredMediaRecordExistsByTitleTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            string title = string.Empty; // TODO: Initialize to an appropriate value
            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.StoredMediaRecordExistsByTitle(title);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for RetriveRowDataToEdit
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void RetriveRowDataToEditTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            string rowId = string.Empty; // TODO: Initialize to an appropriate value
            target.RetriveRowDataToEdit(rowId);
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
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.Page_Load(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for musicWatcher_Renamed
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void musicWatcher_RenamedTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            RenamedEventArgs e = null; // TODO: Initialize to an appropriate value
            target.musicWatcher_Renamed(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for musicWatcher_Deleted
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void musicWatcher_DeletedTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            FileSystemEventArgs e = null; // TODO: Initialize to an appropriate value
            target.musicWatcher_Deleted(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for musicWatcher_Created
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void musicWatcher_CreatedTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            FileSystemEventArgs e = null; // TODO: Initialize to an appropriate value
            target.musicWatcher_Created(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for movieWatcher_Renamed
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void movieWatcher_RenamedTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            RenamedEventArgs e = null; // TODO: Initialize to an appropriate value
            target.movieWatcher_Renamed(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for movieWatcher_Deleted
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void movieWatcher_DeletedTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            FileSystemEventArgs e = null; // TODO: Initialize to an appropriate value
            target.movieWatcher_Deleted(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for movieWatcher_Created
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void movieWatcher_CreatedTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            FileSystemEventArgs e = null; // TODO: Initialize to an appropriate value
            target.movieWatcher_Created(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for lnqMedia_Selected
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void lnqMedia_SelectedTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            LinqDataSourceStatusEventArgs e = null; // TODO: Initialize to an appropriate value
            target.lnqMedia_Selected(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for lnkEdit_Click
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void lnkEdit_ClickTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.lnkEdit_Click(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for IndexOfRowByDataKey
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void IndexOfRowByDataKeyTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            string medId = string.Empty; // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual;
            actual = target.IndexOfRowByDataKey(medId);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetGridViewRecordCountByCurrentMediaType
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void GetGridViewRecordCountByCurrentMediaTypeTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual;
            actual = target.GetGridViewRecordCountByCurrentMediaType();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
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
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.ddlPageSize_SelectedIndexChanged(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for ddlMediaTypes_SelectedIndexChanged
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void ddlMediaTypes_SelectedIndexChangedTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.ddlMediaTypes_SelectedIndexChanged(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for btnDeleteAllRecords_Click
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void btnDeleteAllRecords_ClickTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.btnDeleteAllRecords_Click(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for btnApplyChanges_Click
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void btnApplyChanges_ClickTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.btnApplyChanges_Click(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for btnAddNewMediaRow_Click
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void btnAddNewMediaRow_ClickTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            EventArgs e = null; // TODO: Initialize to an appropriate value
            target.btnAddNewMediaRow_Click(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for btnAddAllFromNetworkFolder_Click
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void btnAddAllFromNetworkFolder_ClickTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            //object sender = null; // TODO: Initialize to an appropriate value
            //EventArgs e = null; // TODO: Initialize to an appropriate value
            //target.btnAddAllFromNetworkFolder_Click(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for addNewMediaRecord
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void addNewMediaRecordTest()
        {
            WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            string mediaName = string.Empty; // TODO: Initialize to an appropriate value
            string filePath = string.Empty; // TODO: Initialize to an appropriate value
            char isViewable = '\0'; // TODO: Initialize to an appropriate value
            string artist = string.Empty; // TODO: Initialize to an appropriate value
            string description = string.Empty; // TODO: Initialize to an appropriate value
            string genre = string.Empty; // TODO: Initialize to an appropriate value
            string mediaType = string.Empty; // TODO: Initialize to an appropriate value
            float duration = 0F; // TODO: Initialize to an appropriate value
            string album = string.Empty; // TODO: Initialize to an appropriate value
            string fileExt = string.Empty; // TODO: Initialize to an appropriate value
            target.addNewMediaRecord(mediaName, filePath, isViewable, artist, description, genre, mediaType, duration, album, fileExt);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for addFilesFromFolder
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void addFilesFromFolderTest()
        {
            //WebsiteAdministration_Accessor target = new WebsiteAdministration_Accessor(); // TODO: Initialize to an appropriate value
            string directory = string.Empty; // TODO: Initialize to an appropriate value
            string mediaType = string.Empty; // TODO: Initialize to an appropriate value
            //int[] expected = null; // TODO: Initialize to an appropriate value
            //int[] actual;
            //actual = WebsiteAdministration.addFilesFromFolder(directory, mediaType);
           // Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for WebsiteAdministration Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void WebsiteAdministrationConstructorTest()
        {
            WebsiteAdministration target = new WebsiteAdministration();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
