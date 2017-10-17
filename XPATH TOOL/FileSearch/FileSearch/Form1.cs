using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.IO;

using System.Xml;
using System.Xml.XPath;

namespace FileSearch
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                XPathExpression.Compile(txtXpath.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show("XPath Expression does not compile");
                return;
            }

            folderBrowserDialog1.SelectedPath = @"c:\temp\xml";

            if (folderBrowserDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                foreach (String s in Directory.GetFiles(folderBrowserDialog1.SelectedPath))
                {

                    XmlDocument doc = new XmlDocument();
                    doc.Load(s);

                    XmlNodeList locations = doc.SelectNodes(txtXpath.Text);

                    MessageBox.Show(s + " " + locations.Count.ToString() + " elements");

                    //foreach (XmlNode node in locations)
                    //{
                    //    MessageBox.Show(node.InnerXml);
                    //}

                }
            }

        }

        private void txtXpath_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
