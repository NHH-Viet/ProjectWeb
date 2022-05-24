using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace projectE.Models
{
    public class Class1
    {
       static string  nameToImg(string name)
        {
            string dau = "https://eldenring.wiki.fextralife.com/file/Elden-Ring/";
            string tenitem = "parrying_dagger_";
            string duoi = "_weapon_elden_ring_wiki_guide_200px.png";
            string than = name;
            string result = dau + tenitem + than + duoi ;
            return result;
        }
    }
}