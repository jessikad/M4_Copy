﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace templateApp.GUI.Modulo9
{
    public partial class M9_ModificarEventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                ((SKD)Page.Master).IdModulo = "9";

                String success = Request.QueryString["eliminacionSuccess"];

                if (success != null)
                {
                    if (success.Equals("1"))
                    {
                        alert.Attributes["class"] = "alert alert-success alert-dismissible";
                        alert.Attributes["role"] = "alert";
                        alert.InnerHtml = "<div><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Evento agregado exitosamente</div>";
                    }

                    if (success.Equals("2"))
                    {
                        alert.Attributes["class"] = "alert alert-success alert-dismissible";
                        alert.Attributes["role"] = "alert";
                        alert.InnerHtml = "<div><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Evento eliminado exitosamente</div>";
                    }

                    if (success.Equals("3"))
                    {
                        alert.Attributes["class"] = "alert alert-success alert-dismissible";
                        alert.Attributes["role"] = "alert";
                        alert.InnerHtml = "<div><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Evento modificado exitosamente</div>";
                    }

                }
            }
        }
    }
}