$(document).ready(function(){
  $('#product-table').dataTable({
    pagingType: 'full_numbers',
    processing: true,
    serverSide: true,
    ajax: {
      url: $('#product-table').data('source')
    },
    columns: [
      { data: 'name' },
      { data: 'stock', className: 'stock-column' },
      { data: 'available' },
      { data: 'amount' }
    ],
    columnDefs: [
      {
        targets: 0,
        createdCell: function(td, cellData, rowData, row, col) {
          console.log('tooltip');
          console.log(rowData.__tooltip_name);
          console.log('----------------');
        }
      },
      {
        targets: 1,
        createdCell: function(td, cellData, rowData, row, col) {
          console.log('cell class');
          if (cellData < 10) {
            $(td).addClass('blue-cell');
          }
        }
      }
    ]
  });
})
