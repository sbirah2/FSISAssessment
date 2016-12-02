using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSISSystem.Data.POCOs
{
    public class PlayerGameStat
    {
        public int PlayerID { get; set; }
        public string PlayerName { get; set; }
        public int Goals { get; set; }
        public int Assists { get; set; }
        public bool Yellow { get; set; }
        public bool Red { get; set; }
        public bool Rostered { get; set; }
    }
}
