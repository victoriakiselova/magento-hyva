<?php namespace Aureatelabs\SliderSplide\Module\ViewModel\Slider;

use Magento\Catalog\Model\ResourceModel\Product\CollectionFactory;
use Magento\Catalog\Helper\Image as ImageHelper;
use Magento\Framework\View\Element\Block\ArgumentInterface;

class Slider implements ArgumentInterface
{
    protected $collectionFactory;
    protected $imageHelper;

    public function __construct(
        CollectionFactory $collectionFactory,
        ImageHelper       $imageHelper
    )
    {
        $this->collectionFactory = $collectionFactory;
        $this->imageHelper = $imageHelper;
    }

    public function getProducts($limit = 10)
    {
        $collection = $this->collectionFactory->create();
        $collection->addAttributeToSelect(['name', 'image', 'small_image', 'thumbnail', 'price', 'url_key'])
            ->addAttributeToFilter('status', 1)
            ->addAttributeToFilter('visibility', ['in' => [2, 3, 4]])
            ->addMediaGalleryData()
            ->setPageSize($limit)
            ->setCurPage(1);
        return $collection;
    }

    public function getImageUrl($product, $imageId = 'category_page_list', $width = 400, $height = 400)
    {
        return $this->imageHelper->init($product, $imageId)
            ->resize($width, $height)
            ->getUrl();
    }
}

?>
