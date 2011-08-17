﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.235
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MediaOnDemand.mobile.pages
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="MEDIAONDEMANDDB")]
	public partial class MobileMediaDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertMobileMedia(MobileMedia instance);
    partial void UpdateMobileMedia(MobileMedia instance);
    partial void DeleteMobileMedia(MobileMedia instance);
    #endregion
		
		public MobileMediaDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["MEDIAONDEMANDDBConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public MobileMediaDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public MobileMediaDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public MobileMediaDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public MobileMediaDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<MobileMedia> MobileMedias
		{
			get
			{
				return this.GetTable<MobileMedia>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.MobileMedia")]
	public partial class MobileMedia : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _mobMediaTitle;
		
		private string _mobMediaFileExt;
		
		private string _mobMediaType;
		
		private int _mobId;
		
		private System.DateTime _mobDateAdded;
		
		private char _mobIsViewable;
		
		private string _mobArtist;
		
		private string _mobDescription;
		
		private string _mobGenre;
		
		private string _mobAlbum;
		
		private string _mobPosterImageUrl;
		
		private System.Nullable<System.DateTime> _mobLastPlayedDate;
		
		private System.Nullable<int> _mobRating;
		
		private string _mobFileName;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnmobMediaTitleChanging(string value);
    partial void OnmobMediaTitleChanged();
    partial void OnmobMediaFileExtChanging(string value);
    partial void OnmobMediaFileExtChanged();
    partial void OnmobMediaTypeChanging(string value);
    partial void OnmobMediaTypeChanged();
    partial void OnmobIdChanging(int value);
    partial void OnmobIdChanged();
    partial void OnmobDateAddedChanging(System.DateTime value);
    partial void OnmobDateAddedChanged();
    partial void OnmobIsViewableChanging(char value);
    partial void OnmobIsViewableChanged();
    partial void OnmobArtistChanging(string value);
    partial void OnmobArtistChanged();
    partial void OnmobDescriptionChanging(string value);
    partial void OnmobDescriptionChanged();
    partial void OnmobGenreChanging(string value);
    partial void OnmobGenreChanged();
    partial void OnmobAlbumChanging(string value);
    partial void OnmobAlbumChanged();
    partial void OnmobPosterImageUrlChanging(string value);
    partial void OnmobPosterImageUrlChanged();
    partial void OnmobLastPlayedDateChanging(System.Nullable<System.DateTime> value);
    partial void OnmobLastPlayedDateChanged();
    partial void OnmobRatingChanging(System.Nullable<int> value);
    partial void OnmobRatingChanged();
    partial void OnmobFileNameChanging(string value);
    partial void OnmobFileNameChanged();
    #endregion
		
		public MobileMedia()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobMediaTitle", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string mobMediaTitle
		{
			get
			{
				return this._mobMediaTitle;
			}
			set
			{
				if ((this._mobMediaTitle != value))
				{
					this.OnmobMediaTitleChanging(value);
					this.SendPropertyChanging();
					this._mobMediaTitle = value;
					this.SendPropertyChanged("mobMediaTitle");
					this.OnmobMediaTitleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobMediaFileExt", DbType="VarChar(4) NOT NULL", CanBeNull=false)]
		public string mobMediaFileExt
		{
			get
			{
				return this._mobMediaFileExt;
			}
			set
			{
				if ((this._mobMediaFileExt != value))
				{
					this.OnmobMediaFileExtChanging(value);
					this.SendPropertyChanging();
					this._mobMediaFileExt = value;
					this.SendPropertyChanged("mobMediaFileExt");
					this.OnmobMediaFileExtChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobMediaType", DbType="VarChar(10) NOT NULL", CanBeNull=false)]
		public string mobMediaType
		{
			get
			{
				return this._mobMediaType;
			}
			set
			{
				if ((this._mobMediaType != value))
				{
					this.OnmobMediaTypeChanging(value);
					this.SendPropertyChanging();
					this._mobMediaType = value;
					this.SendPropertyChanged("mobMediaType");
					this.OnmobMediaTypeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobId", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int mobId
		{
			get
			{
				return this._mobId;
			}
			set
			{
				if ((this._mobId != value))
				{
					this.OnmobIdChanging(value);
					this.SendPropertyChanging();
					this._mobId = value;
					this.SendPropertyChanged("mobId");
					this.OnmobIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobDateAdded", DbType="DateTime NOT NULL")]
		public System.DateTime mobDateAdded
		{
			get
			{
				return this._mobDateAdded;
			}
			set
			{
				if ((this._mobDateAdded != value))
				{
					this.OnmobDateAddedChanging(value);
					this.SendPropertyChanging();
					this._mobDateAdded = value;
					this.SendPropertyChanged("mobDateAdded");
					this.OnmobDateAddedChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobIsViewable", DbType="Char(1) NOT NULL")]
		public char mobIsViewable
		{
			get
			{
				return this._mobIsViewable;
			}
			set
			{
				if ((this._mobIsViewable != value))
				{
					this.OnmobIsViewableChanging(value);
					this.SendPropertyChanging();
					this._mobIsViewable = value;
					this.SendPropertyChanged("mobIsViewable");
					this.OnmobIsViewableChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobArtist", DbType="VarChar(50)")]
		public string mobArtist
		{
			get
			{
				return this._mobArtist;
			}
			set
			{
				if ((this._mobArtist != value))
				{
					this.OnmobArtistChanging(value);
					this.SendPropertyChanging();
					this._mobArtist = value;
					this.SendPropertyChanged("mobArtist");
					this.OnmobArtistChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobDescription", DbType="VarChar(100)")]
		public string mobDescription
		{
			get
			{
				return this._mobDescription;
			}
			set
			{
				if ((this._mobDescription != value))
				{
					this.OnmobDescriptionChanging(value);
					this.SendPropertyChanging();
					this._mobDescription = value;
					this.SendPropertyChanged("mobDescription");
					this.OnmobDescriptionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobGenre", DbType="VarChar(30)")]
		public string mobGenre
		{
			get
			{
				return this._mobGenre;
			}
			set
			{
				if ((this._mobGenre != value))
				{
					this.OnmobGenreChanging(value);
					this.SendPropertyChanging();
					this._mobGenre = value;
					this.SendPropertyChanged("mobGenre");
					this.OnmobGenreChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobAlbum", DbType="VarChar(30)")]
		public string mobAlbum
		{
			get
			{
				return this._mobAlbum;
			}
			set
			{
				if ((this._mobAlbum != value))
				{
					this.OnmobAlbumChanging(value);
					this.SendPropertyChanging();
					this._mobAlbum = value;
					this.SendPropertyChanged("mobAlbum");
					this.OnmobAlbumChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobPosterImageUrl", DbType="VarChar(100)")]
		public string mobPosterImageUrl
		{
			get
			{
				return this._mobPosterImageUrl;
			}
			set
			{
				if ((this._mobPosterImageUrl != value))
				{
					this.OnmobPosterImageUrlChanging(value);
					this.SendPropertyChanging();
					this._mobPosterImageUrl = value;
					this.SendPropertyChanged("mobPosterImageUrl");
					this.OnmobPosterImageUrlChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobLastPlayedDate", DbType="DateTime")]
		public System.Nullable<System.DateTime> mobLastPlayedDate
		{
			get
			{
				return this._mobLastPlayedDate;
			}
			set
			{
				if ((this._mobLastPlayedDate != value))
				{
					this.OnmobLastPlayedDateChanging(value);
					this.SendPropertyChanging();
					this._mobLastPlayedDate = value;
					this.SendPropertyChanged("mobLastPlayedDate");
					this.OnmobLastPlayedDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobRating", DbType="Int")]
		public System.Nullable<int> mobRating
		{
			get
			{
				return this._mobRating;
			}
			set
			{
				if ((this._mobRating != value))
				{
					this.OnmobRatingChanging(value);
					this.SendPropertyChanging();
					this._mobRating = value;
					this.SendPropertyChanged("mobRating");
					this.OnmobRatingChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_mobFileName", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string mobFileName
		{
			get
			{
				return this._mobFileName;
			}
			set
			{
				if ((this._mobFileName != value))
				{
					this.OnmobFileNameChanging(value);
					this.SendPropertyChanging();
					this._mobFileName = value;
					this.SendPropertyChanged("mobFileName");
					this.OnmobFileNameChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
