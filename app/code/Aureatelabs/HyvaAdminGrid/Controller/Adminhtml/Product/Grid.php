<?php

namespace Aureatelabs\HyvaAdminGrid\Controller\Adminhtml\Product;

use Magento\Backend\App\Action;
use Magento\Backend\App\Action\Context;
use Magento\Framework\View\Result\PageFactory;

class Grid extends Action
{
    const ADMIN_RESOURCE = 'Aureatelabs_HyvaAdminGrid::product_grid';

    protected $resultPageFactory;

    public function __construct(
        Context $context,
        PageFactory $resultPageFactory
    ) {
        parent::__construct($context);
        $this->resultPageFactory = $resultPageFactory;
    }

    protected function _isAllowed()
    {
        return $this->_authorization->isAllowed('Aureatelabs_HyvaAdminGrid::product_grid');
    }

    public function _processUrlKeys()
    {
        return true;
    }

    public function execute()
    {
        $resultPage = $this->resultPageFactory->create();
        $resultPage->getConfig()->getTitle()->prepend(__('Products Grid'));
        return $resultPage;
    }
}
