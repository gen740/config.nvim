const document = Application("Skim").documents[0];
document.viewSettings = { displayMode: "single page" };

const pageIndex = parseInt(document.currentPage().index());
const nextPageIndex = pageIndex - 2;

if (0 <= nextPageIndex) {
  document.go({ to: document.pages[nextPageIndex] });
}
