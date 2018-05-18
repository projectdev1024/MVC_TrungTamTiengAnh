using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;

namespace TrungTamTiengAnh.Models.DAO
{
    public class UserDAO
    {
        MyModel mymd;
        public UserDAO()
        {
            mymd = new MyModel();
        }
        public bool Login(string username, string password)
        {
            var rs = mymd.TaiKhoans.Count(x => x.UserName == username && x.PassWord == password);
            if (rs > 0)
                return true;
            else
                return false;
        }
    }
}