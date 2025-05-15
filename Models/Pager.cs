namespace Nimap_Project.Models
{

    public class Pager
    {
        public int TotalItems { get; private set; }
        public int CurrentPage { get; private set; }

        public int PageSize { get; private set; }

        public int TotalPages { get; private set; }

        public int StartPage { get; private set; }

        public int EndPage { get; private set; }

        public Pager()
        {

        }

        public Pager(int totalItems, int page, int pagesize = 3)
        {
       
            TotalItems=totalItems;
            PageSize = pagesize;
            TotalPages = (int)Math.Ceiling((double)TotalItems / PageSize);
            CurrentPage = page;


            StartPage = Math.Max(1, CurrentPage - 2);
            EndPage = Math.Min(TotalPages, CurrentPage + 2);



            
        }
    }
}
