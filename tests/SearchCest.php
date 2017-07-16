<?php

class SearchCest
{
    public function check(AcceptanceTester $I)
    {
        $I->wantTo('Ensure that search works fine!');

        $I->amOnPage('/');

        $I->fillField('[name="q"]', 'mining');
        $I->click('.js-search-submit');

        $I->canSeeInCurrentUrl('/search?');
        $I->see('data');
    }
}