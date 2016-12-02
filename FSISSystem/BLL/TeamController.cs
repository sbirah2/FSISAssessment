using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel;
using FSISSystem.DAL;
using FSISSystem.Data.Entities;
using FSISSystem.Data.POCOs;
#endregion

namespace FSISSystem.BLL
{
    [DataObject]
    public class TeamController
    {
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<ForeignKeyList> Get_TeamList()
        {
            using (var context = new FSISContext())
            {
                var results = from x in context.Teams
                              orderby x.TeamName
                              select new ForeignKeyList
                              {
                                  PFKeyIdentifier = x.TeamID,
                                  DisplayText = x.TeamName
                              };
                return results.ToList();
            }
        }
    }
}
