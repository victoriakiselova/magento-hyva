<?php

namespace Aureatelabs\HyvaAdminGrid\Block\Html;

use Magento\Framework\Locale\Bundle\DataBundle;

class Calendar extends \Magento\Framework\View\Element\Html\Calendar
{
    protected function _toHtml()
    {
        $localeData = (new DataBundle())->get($this->_localeResolver->getLocale());

        $daysData = $localeData['calendar']['gregorian']['dayNames'];
        $this->assign(
            'days',
            [
                'wide' => $this->encoder->encode(array_values(iterator_to_array($daysData['format']['wide']))),
                'abbreviated' => $this->encoder->encode(
                    array_values(iterator_to_array($daysData['format']['abbreviated']))
                ),
            ]
        );

        $monthsData = $localeData['calendar']['gregorian']['monthNames'];
        $this->assign(
            'months',
            [
                'wide' => $this->encoder->encode(array_values(iterator_to_array($monthsData['format']['wide']))),
                'abbreviated' => $this->encoder->encode(
                    array_values(
                        iterator_to_array(
                            null !== $monthsData->get('format')->get('abbreviated')
                                ? $monthsData['format']['abbreviated']
                                : $monthsData['format']['wide']
                        )
                    )
                ),
            ]
        );

        if ($localeData->get('fields')) {
            $this->assign('today', $this->encoder->encode($localeData['fields']['day']['relative']['0']));
            $this->assign('week', $this->encoder->encode($localeData['fields']['week']['dn']));
        }

        $amPmMarkers = $localeData['calendar']['gregorian']['AmPmMarkers'] ?? null;
        $this->assign('am', $this->encoder->encode($amPmMarkers !== null ? (string)($amPmMarkers['0'] ?? '') : ''));
        $this->assign('pm', $this->encoder->encode($amPmMarkers !== null ? (string)($amPmMarkers['1'] ?? '') : ''));

        $this->assign(
            'firstDay',
            (int)$this->_scopeConfig->getValue(
                'general/locale/firstday',
                \Magento\Store\Model\ScopeInterface::SCOPE_STORE
            )
        );
        $this->assign(
            'weekendDays',
            $this->encoder->encode(
                (string)$this->_scopeConfig->getValue(
                    'general/locale/weekend',
                    \Magento\Store\Model\ScopeInterface::SCOPE_STORE
                )
            )
        );

        $this->assign(
            'defaultFormat',
            $this->encoder->encode(
                $this->_localeDate->getDateFormat(\IntlDateFormatter::MEDIUM)
            )
        );
        $this->assign(
            'toolTipFormat',
            $this->encoder->encode(
                $this->_localeDate->getDateFormat(\IntlDateFormatter::LONG)
            )
        );

        $englishMonths = (new DataBundle())->get('en_US')['calendar']['gregorian']['monthNames'];
        $enUS = new \stdClass();
        $enUS->m = new \stdClass();
        $enUS->m->wide = array_values(iterator_to_array($englishMonths['format']['wide']));
        $enUS->m->abbr = array_values(iterator_to_array($englishMonths['format']['abbreviated']));
        $this->assign('enUS', $this->encoder->encode($enUS));

        if (!$this->getTemplate()) {
            return '';
        }

        return $this->fetchView($this->getTemplateFile());
    }
}

