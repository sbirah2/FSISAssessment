using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additonal Namespaces
using FSISSystem.BLL;
using FSISSystem.Data.POCOs;
using FSISSystem.Data.Entities;
using FSIS.UI;
using System.Collections;
using System.Data.Entity.Validation;
#endregion
public partial class Assessments_Query : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckForException(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MessageUserControl.HandleDataBoundException(e);
    }
}